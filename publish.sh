#!/bin/bash

mkdir -p /tmp/workspace
cp -r * /tmp/workspace/
git checkout -f -B gh-pages
git merge master
jupyter-nbconvert --to slides explore.ipynb --reveal-prefix=reveal.js
mv explore.slides.html  index.html
git add index.html
git commit -m "update"
git push origin master gh-pages
git checkout master
cp -r /tmp/workspace/* .
rm -rf /tmp/workspace
