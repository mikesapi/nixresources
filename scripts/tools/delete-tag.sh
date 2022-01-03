#! /bin/bash -e

git push origin :refs/tags/$1
git tag --delete $1
