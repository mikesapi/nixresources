#!/bin/bash -e

# A script to open urls in a text file.

# Check the input.
function help {
  echo ""
  echo "Usage: ./open-urls-as-tabs.sh filename.txt"
  echo ""
}

if [ $# -ne 1 ]
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

for line in `sed '/^[$#]/d' $1`; do
  command="open -na \"Google Chrome\" --args --new-tab \"$line\""
  eval $command
done
