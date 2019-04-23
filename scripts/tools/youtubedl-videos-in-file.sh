#!/bin/bash -e

# A script to youtube-dl the urls in a text file.

# Check the input.
function help {
  echo ""
  echo "Usage: ./youtubedl-videos-in-file.sh filename.txt"
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
  youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/bestvideo+bestaudio' --merge-output-format mp4 "$line"
done
