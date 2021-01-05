#!/bin/bash -e

echo "[main] ...Checking dependencies..."
PKGSTOINSTALL=""
for var in "$@"
do
  if [[ ! `dpkg -l | grep -w "ii  $var "` ]]
  then
    echo "[main] ...$var... MISSING"
    PKGSTOINSTALL="$PKGSTOINSTALL $var"
  else
    echo "[main] ...$var... OK"
  fi
done

if [ "$PKGSTOINSTALL" != "" ]
then
  echo "[main] ...Installing missing dependencies:$PKGSTOINSTALL ..."
  sudo apt-get install $PKGSTOINSTALL
fi
