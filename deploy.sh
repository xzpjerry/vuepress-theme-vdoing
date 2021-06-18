#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run build

# 进入生成的文件夹
cd docs/.vuepress/dist

# deploy to github pages
echo 'blog.zhipengx.com' > CNAME


msg='来自github actions的自动部署'
githubUrl=https://xugaoyi:${ACCESS}@github.com/xzpjerry/vuepress-theme-vdoing.git
git config --global user.name "xzpjerry"
git config --global user.email "xzpjerry@gmail.com"

git init
git add -A
git commit -m "${msg}"
git push -f $githubUrl master:gh-pages # 推送到github gh-pages分支

cd -
rm -rf docs/.vuepress/dist
