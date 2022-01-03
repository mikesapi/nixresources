#! /bin/bash -e

# Check the input
function help {
  echo ""
  echo "Usage: ./rsync_backup [additioanl options] [source paths] [destination dir]"
  echo "Example 1: ./rsync_backup /path/to/source1 /path/to/dest/"
  echo "Example 2: ./rsync_backup \"/path/to/source1 /path/to/source2\" /path/to/dest/"
  echo ""
}

if [ $# -lt 2 ]
then
  help
  exit
fi

## Root source and sink

includes='--include=".git/" --include=".git*" --include=".vim/" --include=".vim*" --include=".keep*" --include=".task/"'
excludes='--exclude=".*" --exclude="./*" --exclude="build/" --exclude="libraries/" --exclude="3rdparty/" --exclude="*.tags"'
delete='--delete --delete-excluded'

## rsync command.
# -a or --archive is equivalent to: -rlptgoD.
# When copying to ntfs, we do not want p(permissions), g(group), o(owner) to be transferred.
# r - copies recursively
# l - copies symlinks as symlinks
# t - preserves modification time
# D - preserves device and special files
# --modify-window=1, ignore file changes that are one second apart from original. Modification times can change slightly from ext to windows format, making this essential to avoid redundant copying because of small time changes due to filesystem conventions.
cmd="rsync -rltDv --modify-window=1 --progress $includes $excludes $delete $@"

## First a dry run, double check which files are marked for deletion.
eval "$cmd --dry-run --itemize-changes | grep -e deleting -e '<' -e '>' -e sent -e total"

echo $cmd

## Then the real thing.
permission-to-run.sh "Perform the real rsync?" "$cmd"

## Add a timestamp to remember date and time of last sync.
dst="${@: -1}"
if [ -d $dst ]
then
  time-stamp-dir-sync.sh $dst
fi
