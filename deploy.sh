#!/bin/bash
# run in MASTER_DIR
set -x
set -e

MESSAGE=$1

PROGRAM="cpp"
GITBOOK_DIR="/Users/weihuanghu/hexo/gitbook"
MASTER_DIR="${GITBOOK_DIR}/${PROGRAM}-notes"
GHPAGE_DIR="${GITBOOK_DIR}/${PROGRAM}-gh-pages"

# build
gitbook build

# clean GHPAGE_DIR
rm -fr ${GHPAGE_DIR}/*

# copy _book to GHPAGE_DIR
cp -fr ${MASTER_DIR}/_book/* ${GHPAGE_DIR}
cp -fr ${MASTER_DIR}/README.md ${GHPAGE_DIR}

# git commit
cd ${GHPAGE_DIR}
git add --all
git commit -m "${MESSAGE}"
git push origin gh-pages
