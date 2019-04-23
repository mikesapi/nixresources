#!/bin/bash -e

# A script to wget the urls in a text file.

# Check the input.
function help {
  echo ""
  echo "Usage: ./wgetUrlsInFile.sh filename.txt path/to/save/files/"
  echo ""
}

if [ $# -ne 2 ]
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

if [ ! -d $2 ]
then
  echo "$2 does not exist"
  help
  exit
fi

for line in `sed '/^[$#]/d' $1`; do
  command="wget -nc -P $2 $line"
  eval $command
done
