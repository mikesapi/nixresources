# Replace all zips in a directory with an unzipped version.

This command depends on `trash-cli' program.

## Command:
```
for i in *.zip; do echo $i; unzip $i; trash-put $i; done
```
