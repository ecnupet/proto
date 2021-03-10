#!/bin/bash

set -e
echo -e "\033[0;32mgit config\033[0m"
git config --global user.name "tonyshanc"
git config --global user.email "845700113@qq.com"
git config --global push.default simple
git remote set-url origin https://github.com/ecnupet/proto.git
mkdir -p ~/.ssh/
export ACTION_DEPLOY_KEY="-----BEGIN OPENSSH PRIVATE KEY-----
b3BlbnNzaC1rZXktdjEAAAAABG5vbmUAAAAEbm9uZQAAAAAAAAABAAABFwAAAAdzc2gtcn
NhAAAAAwEAAQAAAQEApygGY922Qpd0ZOYQZq/uiyf/faBxmebS6bpDEqjw+lF3phJmd5KL
NVUNQBZ+zeGA4XXn5yCa8Eyr/CcmbhaxsFT93keyHj0Iqd3Wisxa5hmkmn4ueCUXsuD5Yy
QICPOF1WGvVgpmuTqOLjC/pLeRjBkZZFdfQ2HxBF2pjskOUUX3dO2Qhj7NYob5Unq+D3lE
jSIhHv8eShxfXqwbrDdk6yF6juqAEw9AXSkg4yIwhS2LnrD4bDH8MqBupginqM892dDy72
v+J+G5ZEazyld3DAoHJ1J9SXsnaWEB9xt6+OCgbTpR/Ven6VIOD1aEu5rWfsDLiuSE6iR5
VJ1rBeLCUQAAA9hOr06sTq9OrAAAAAdzc2gtcnNhAAABAQCnKAZj3bZCl3Rk5hBmr+6LJ/
99oHGZ5tLpukMSqPD6UXemEmZ3kos1VQ1AFn7N4YDhdefnIJrwTKv8JyZuFrGwVP3eR7Ie
PQip3daKzFrmGaSafi54JRey4PljJAgI84XVYa9WCma5Oo4uML+kt5GMGRlkV19DYfEEXa
mOyQ5RRfd07ZCGPs1ihvlSer4PeUSNIiEe/x5KHF9erBusN2TrIXqO6oATD0BdKSDjIjCF
LYuesPhsMfwyoG6mCKeozz3Z0PLva/4n4blkRrPKV3cMCgcnUn1JeydpYQH3G3r44KBtOl
H9V6fpUg4PVoS7mtZ+wMuK5ITqJHlUnWsF4sJRAAAAAwEAAQAAAQEAkRqqqWieviHxtWEN
3cZdokkffbOYygvZDXJWpU0om3O7FNwmPShmVe62KOseOqTGF3Id1MK2HWHBbouhzbE/oJ
23H41Hbv52ldbwVd7eDZ83B7H/ruYsM2ketFRj8TlM9ZXt+hffYm4VXL2Or3N3EpH7O+Ko
3LqZ2btg5IVeO2fFFiB/oaXgHIGhwF/CJE6kdB9iZBjtil3g2iINIW+TkDAD0w781xmx6r
rWCTj4rYd/9BwG4uRKBvp4fbk6okZLuow+oc2wAOeltKKyyI1fmRnYkxxIUauQQUsBTrME
uiIEp+Mvo0Lr1llWQ1Y44qQbDYHfLDEmbGNvnpCU5gPYAQAAAIEAoYvFJ4eZNP0rCHW0/M
7G7UOw0mLMxHskASyGu5Z+LtSrusTvqF72VWHJJkPlrMX4/s11JSfMPwNI3SGk8qihj6dG
74RtM3WQauMEy2/71A94Ytr2T86N8wWIj1CiyhCQbSGx1X/zS3zth2ZLxosj7S8kuo78zB
rtVw3MRZA5lYgAAACBANMlLNkjbIwyHt4qGGz2LXwyJ0UpxbFG6JSslnqKU4vBXCr2lZaQ
4yDcsrJAmjYY7L4FwqKx262cDDsvh1UEz7vB+wik1TBbMnkj8xWKJUnSuQmI5AzOW++geO
vFLNTxn0iFwsNxAF5cDRWjWVXE7hpTD2C8QuaRhb3HpF5/2T/RAAAAgQDKqpRMsb8APcSQ
IFqjQ/W854T5isnQSDEeLlWVmNzIl2JS01ozLMNbnPhdq5W1KMAWdLiOsQ7E3XeP3bk9mg
SMSAwEEPHdB2Chs/Bj9XP8bPIJZABwZCMn1WIqGogYbnErJjV6mlnWmQ7lzGnqmkw3ClTk
oX8dlL4yBtq7QQB6gQAAAB9jaGFvLmRhbkBsbHNzLU1hY0Jvb2stUHJvLmxvY2FsAQI=
-----END OPENSSH PRIVATE KEY-----
"
echo $ACTION_DEPLOY_KEY | tr -d '\r' > ~/.ssh/id_rsa
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
    git push origin $tagname
else
    echo -e "\033[0;32mNo changes applied on pb.go\033[0m"
fi
