# Create multiple numbered directories.

## Command.
```mkdir `seq 0 99` ```

or

```
for ((i=0;i<=99;i+=1)); do
mkdir $i
done
```
