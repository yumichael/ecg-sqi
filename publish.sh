#!/bin/bash

cp -f ../ecg-sqi/explore.ipynb ./
jupyter-nbconvert --to slides explore.ipynb --reveal-prefix=reveal.js
mv explore.slides.html  index.html
mkdir -p /tmp/workspace
cp -r * /tmp/workspace/
git add -A .
git commit -m "Update"
git checkout -B gh-pages
cp -r /tmp/workspace/* .
git add -A .
git commit -m "new version"
git push origin master gh-pages
git checkout master
rm -rf /tmp/workspace
