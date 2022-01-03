#! /bin/bash -e

bname=$1
oldname=$bname
newname=archive/$bname

git checkout $oldname
git branch -m $newname
git push origin :$oldname $newname
git push origin -u $newname
