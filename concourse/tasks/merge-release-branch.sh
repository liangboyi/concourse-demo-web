#!/bin/bash

MESSAGE="[Concourse CI] Merge release to ${MERGE_TO}"

#将repo中内容放置out中
cd out
mv -f ../repo/* ./

#配置基本的git参数
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"

#把release merge到资源repo中
git remote add -f release ../repo-release
git merge --no-edit release/release -m ${MESSAGE}