#!/bin/bash

if [ $# -ne 1 ]
then
  echo "Usage: ./find-cluttered-directories.sh [path/to/dir]"
  exit
fi

echo "Finding cluttered directories..."

find "$@" -type d -print0 2>/dev/null | while IFS= read -r -d '' file; do 
    echo -e `ls -A "$file" 2>/dev/null | wc -l` "files in:\t $file"
done | sort -nr | head -30 | awk '{print NR".", "\t", $0}'
