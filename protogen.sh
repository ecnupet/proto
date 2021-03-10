#!/bin/bash

set -e
echo -e "\033[0;32mgit config\033[0m"
git config --global user.name "bot"
git config --global user.email "845700113@qq.com"
echo "origin"
git remote show origin
mkdir -p ~/.ssh/
echo "$ACTION_DEPLOY_KEY"
echo "$ACTION_DEPLOY_KEY" | tr -d '\r' > ~/.ssh/id_rsa
chmod 600 ~/.ssh/id_rsa
ssh-keyscan github.com >> ~/.ssh/known_hosts
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
pwd
# createsrc/google/api for annotiation
export GOPATH=/home/runner/go
export PROTO_PATH=$GOPATH/src/github.com/ecnupet/proto
GO111MODULE=on go get github.com/grpc-ecosystem/grpc-gateway/protoc-gen-grpc-gateway
# 1MODULE=on go get github.com/grpc-ecosystem/grpc-gateway/protoc-gen-swagger
mkdir $GOPATH/src && chmod 777 $GOPATH/src
mkdir -p $GOPATH/src/github.com/ecnupet/proto && git clone https://github.com/ecnupet/proto.git $GOPATH/src/github.com/ecnupet/proto
mkdir -p $GOPATH/src/github.com/googleapis && git clone https://github.com/googleapis/googleapis.git $GOPATH/src/github.com/googleapis/googleapis
mkdir -p $GOPATH/src/github.com/grpc-ecosystem/grpc-gateway && git clone -b v1 https://github.com/grpc-ecosystem/grpc-gateway $GOPATH/src/github.com/grpc-ecosystem/grpc-gateway

# install protoc
GO111MODULE=on go get github.com/golang/protobuf/protoc-gen-go

# protoc --go_out=. grpc/*.proto
protoc -I/usr/local/include -I. \
	-I$PROTO_PATH \
	-I$GOPATH/src/github.com/googleapis/googleapis \
	-I$GOPATH/src/github.com/grpc-ecosystem/grpc-gateway \
	--go_out=. grpc/*.proto
pwd
ls -al
git add -f *.pb.go

changes=`git diff --name-only --cached | wc -l | tr -d '[:space:]'`
if [[ $changes > 0 ]]; then
    echo -e "\033[0;32mPush changes on pb.go\033[0m"
    git commit -m "Auto generated go source code based on $git_head"

    # Add tag, auto incr tag
    tagname=$(echo $latest_tag | awk -F. -v OFS=. '{++$NF;print};')
    git tag -a "$tagname" -m "`git log --oneline --format=%B -n 1 HEAD | head -n 1`"
    git push --force --quiet https://TonyShanc:$TOKEN@github.com/ecnupet/proto.git $tagname
else
    echo -e "\033[0;32mNo changes applied on pb.go\033[0m"
fi
