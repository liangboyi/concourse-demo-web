#!/bin/bash

#获取version资源中的版本号
VERSION=`cat version/number`
MESSAGE="[Concourse CI] Release $VERSION"

cd out

#资源库代码放入out目录
mv -f ../repo/* ./

#修改pom.xml中的version内容
echo "Bump to ($VERSION)"
./mvnw versions:set -DnewVersion=${VERSION}

#配置git基本信息，用于后面的git push(job中的put操作)
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git add pom.xml
git commit -m "${MESSAGE}"