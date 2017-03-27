#!/bin/bash

#master打了tag后，更新release
cd out-release

#资源库代码放入out目录
mv -f ../repo-release/* ../repo-release/.[^.]* ./

#配置git基本信息，用于后面的git push(job中的put操作)
git config --global user.email "${GIT_EMAIL}"
git config --global user.name "${GIT_NAME}"
git remote add -f master ../repo
git merge --no-edit master/master
