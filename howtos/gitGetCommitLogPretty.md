# Creating a pretty git log.

#### To get a pretty commit log for multiple users:
```
git log --author="\(Foo\)\|\(Bar\)" --date=local --pretty=format:"%h%x09%an%x09%ad%x09%s"
```
