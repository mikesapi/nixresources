#! /bin/bash -e

git push origin :refs/tags/$1
git tag --delete $1
git tag -a "${1}" -m "tagging version ${1}"
git push origin $1
