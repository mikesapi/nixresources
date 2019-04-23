# Count the total number of files in a directory.

* `ls -1R` One file per line, recursively.
* `grep -i` Ignore case.
* `wc -l` Print the newline counts.

## Command:
`ls -1R | grep -i .*.mp3 | wc -l`
