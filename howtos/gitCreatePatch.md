# Creating and applying patches in git.

#### To create a patch which includes all the commits from the master branch up to the current source branch:
```
git format-patch master --stdout > fix-several-issues.patch
```

#### To apply the same patch to the current master branch:
```
git am fix-several-issues.patch
```

[More info](https://www.lullabot.com/articles/git-best-practices-upgrading-the-patch-process)
