#!/bin/bash

set -e
echo -e "\033[0;32mgit config\033[0m"
export CI_PUSH_TOKEN=78125d8696da6829459c1e9074731b37709b486a
git config --global user.name "tonyshanc"
git config --global user.email "845700113@qq.com"
git config --global push.default simple
git remote set-url origin https://tonyshanc:${CI_PUSH_TOKEN}@github.com:ecnupet/proto.git
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

# install protoc
GO111MODULE=on go get github.com/golang/protobuf
GO111MODULE=on go get github.com/golang/protobuf/protoc-gen-go

protoc --go_out=. grpc/*.proto
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
