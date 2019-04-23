# Replace all files/directories with a zipped version.

This command depends on `trash-cli' program.

## Command:
```
for i in * ; do zip -vr "$i.zip" "$i" ; trash-put "$i"; done
```
