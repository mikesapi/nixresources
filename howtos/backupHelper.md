# Simple script which uses the rsync-backup.sh for periodic backups.

```
#! /bin/bash -e

sourcePaths="/path/to/dir1 /path/to/dir2 /path/to/file1"

echo "backing up the following files and directories: ${sourcePaths}"

dst="/path/to/dest/"
rsync-backup.sh "$sourcePaths" $dst
```
