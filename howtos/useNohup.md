# An example of launching a process on a remote machine.
.. and be able to close the connection without killing the process.

Log into machine.
Run script in detached mode with:
```
nohup script >script.out 2>script.err &
```

Log in periodically to check `script.out` and `script.err` for any messages.
To combine output and errors in same file:

```
nohup script >script.out 2>&1 &
```
