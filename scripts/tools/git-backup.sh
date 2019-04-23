#!/bin/bash -e

# This script allows you to backup the git repositories listed in repos.txt

for repourl in `sed '/^[$#]/d' repos.txt`; do

  reponamedotgit=${repourl##*/}
  reponame=${reponamedotgit%%.*}
  echo  backing up $repourl

  if [ -f $reponame.zip ]
  then
    echo File ${reponame}.zip found,

    if test `find "${reponame}.zip" -mmin +120`
    then
      echo and is 120 minutes or older, replacing..
    else  
      echo and is less than 120 minutes old, skipping..
      echo " "
      continue 
    fi

    mv $reponame.zip $reponame.zip.backup
  fi

  git clone $repourl
  zip -rm $reponame.zip $reponame

  if [ -f $reponame.zip ]
  then
    rm -rf $reponame.zip.backup
  fi
done
