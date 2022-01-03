#! /bin/bash -e

# Check the input
function help {
  echo ""
  echo "Usage: ./remove-files-from-repo.sh fileList.txt"
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
  command="git filter-branch --force --index-filter 'git rm -r --cached --ignore-unmatch $line' --prune-empty --tag-name-filter cat -- --all"
  eval $command
done
