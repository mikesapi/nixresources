#!/bin/bash -e

# This script allows you to backup the git repositories listed in repos.txt

function help {
  echo ""
  echo "Usage: ./git-backup [path-to-repos.txt]"
  echo "add --lfs if you have repos which use git lfs."
  echo "Example 1: ./git-backup path/to/repos.txt"
  echo "Example 2: ./git-backup path/to/repos.txt --lfs"
  echo ""
}

if [ $# -lt 1 ]
then
  help
  exit
fi

if [ ! -f $1 ]
then
  echo "$1 does not exist"
  help
  exit
fi

src=$1

for repourl in `sed '/^[$#]/d' $src`; do

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

  git clone --recurse-submodules $repourl
  if [[ "$@" == "--lfs" ]]
  then
    git lfs fetch --all
  fi
  zip -rm $reponame.zip $reponame

  if [ -f $reponame.zip ]
  then
    rm -rf $reponame.zip.backup
  fi
done
