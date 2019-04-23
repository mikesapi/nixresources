# Find and replace 'foo' with 'bar' in '.txt' files.

## Command.
```
find . -type f -name "*.txt" -exec sed -i'' -e 's/foo/bar/g' {} +
```
