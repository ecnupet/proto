#!/bin/bash

set -e
echo -e "\033[0;32mgit config\033[0m"
# 78125d8696da6829459c1e9074731b37709b486a
export CI_PUSH_TOKEN=78125d8696da6829459c1e9074731b37709b486a
git config --global --add url."git@github.com:".insteadOf "https://github.com"
git config --global user.name "TonyShanc"
git config --global user.password ${CI_PUSH_TOKEN}
git config --global user.email "845700113@qq.com"
git config --global push.default simple
git remote set-url origin https://github.com/ecnupet/proto.git
git clone https://github.com/ecnupet/proto.git
cd proto
git fetch origin main
echo "list tag"
git tag
latest_tag=$(git describe --tags `git rev-list --tags --max-count=1`)
git_head=`git rev-parse --short HEAD`

# checkout & rebase
echo -e "\033[0;32mCheckout & rebase\033[0m"
git checkout $latest_tag
git rebase -q $git_head

# auto squash if there's too many accumulated commits
max_commits=50
commits=`git log HEAD...$git_head --oneline | wc -l | tr -d '[:space:]'`
if [[ $commits > $max_commits ]]; then
    echo -e "\033[0;32mToo much generated commits, squashing...\033[0m"
    last_commit_msg=`git log --format=%B -n 1`
    git reset --soft HEAD~$((commits-2))  # Squash down to the first (huge) generation commit
    git commit -m "$last_commit_msg"
fi

# createsrc/google/api for annotiation
GO111MODULE=on go get github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
GO111MODULE=on go get github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
mkdir -p $GOPATH/src/github.com/ecnupet/proto && git clone https://github.com/ecnupet/proto.git $GOPATH/src/github.com/ecnupet/proto
mkdir -p $GOPATH/src/github.com/googleapis && git clone https://github.com/googleapis/googleapis.git $GOPATH/src/github.com/googleapis/googleapis
mkdir -p $GOPATH/src/github.com/grpc-ecosystem/grpc-gateway && git clone -b v1 https://github.com/grpc-ecosystem/grpc-gateway $GOPATH/src/github.com/grpc-ecosystem/grpc-gateway

# install protoc
GO111MODULE=on go get github.com/golang/protobuf/protoc-gen-go

# protoc --go_out=. grpc/*.proto
export PROTO_PATH=$(GOPATH)/src/github.com/ecnupet/proto
protoc -I/usr/local/include -I. \
	-I$(PROTO_PATH) \
	-I$(GOPATH)/src/github.com/googleapis/googleapis \
	-I$(GOPATH)/src/github.com/grpc-ecosystem/grpc-gateway \
	--go_out=. grpc/*.proto

git add -f **/*.pb.go 

changes=`git diff --name-only --cached | wc -l | tr -d '[:space:]'`
if [[ $changes > 0 ]]; then
    echo -e "\033[0;32mPush changes on pb.go\033[0m"
    git commit -m "Auto generated go source code based on $git_head"

    # Add tag, auto incr tag
    tagname=$(echo $latest_tag | awk -F. -v OFS=. '{++$NF;print};')
    git tag -a "$tagname" -m "`git log --oneline --format=%B -n 1 HEAD | head -n 1`"
    git push origin $tagname
else
    echo -e "\033[0;32mNo changes applied on pb.go\033[0m"
fi
