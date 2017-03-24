#!/bin/bash

VERSION=`cat version/number`-SNAPSHOT
MESSAGE="[Concourse CI] Bump to Next Development Version ($VERSION)"

#将repo中内容(release)移动到out
cd out
mv -f ../repo/* ../repo/.[^.]* ./

#修改pom.xml中的verison内容
echo "Bump to $VERSION"
./mvnw versions:set -DnewVersion=${VERSION} -DallowSnapshots

#配置git基本信息，用于后面的git push(job中的put操作)
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git add pom.xml
git commit -m "${MESSAGE}"
