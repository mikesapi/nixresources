# This is the readme file, so readme.

A brief description of each script:

```
tools/
├── add-tools-path-to-bashrc.sh    - add this directory to the system path to make the scripts accessible system-wide.
├── cpu-benchmark.sh               - test the cpu and monitor the cpu temperature to ensure cooling is fine.
├── cpu-benchmark-to-file.sh       - save the output of `cpu-benchmark.sh` to a timestamped file in `~/documents/admin/pchealth` to record the cpu's health over a period of time. This is useful, for instance, to double check that you've installed the thermal paste correctly, or to check if your cpu cooler is effective.
├── find-cluttered-directories.sh  - find directories which contain large numbers of files, which can slow down backups/syncs. Best to zip cluttered directories that are not in use.
├── ghostscript-pdf-compress.sh    - helps to shrink the size of pdfs. Useful if you need to submit your resume/transcripts/paper and there's a size limit.
├── git-backup.sh                  - downloads and zips the git repos listed in a text file.
├── install-packages.sh            - only tries to install packages if they are not already installed. 
├── permission-to-run.sh           - asks user for permission before running a script.
├── README.md                      - used to explain the contents of this directory.
├── restart.sh                     - restarts the pc.
├── rsync-backup.sh                - using a sync tool for backups. The script defines which directories should be ignored, and sets flags suitable for a backup. It also does a dry-run and outputs the chagnes before performing the real sync. At the end of the sync, it adds a timestamped file to record the backup time.
├── time-stamp-dir-sync.sh         - writes an empty file named with the current time. May be used to recored the time a backup occurred.
├── wget-urls-in-file.sh           - downloads all paths in a text file with wget.
└── youtubedl-videos-in-file.sh    - downloads all youtube videos listed in a text file.
```
