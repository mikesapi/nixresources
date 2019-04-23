#!/bin/bash -e

# Check the input
function help {
  echo ""
  echo "Usage: ./time_stamp_dir_sync [destination dir]"
  echo ""
}

if [ $# -ne 1 ]
then
  help
  exit
fi

# Create the timestamp.
timestamp=$(date +%Y-%m-%d--%H-%M-%S)

if [ -d $1 ]; then

  # First remove any previous timestamps.
  rm -f $1/*.ts

  # Create a file with the timestamp.
  touch $1/$timestamp.ts

elif [[ $1 == *":"* ]]; then

  echo "remote address detected, attempting to copy timestamp with rsync:"
  # Create a file with the timestamp.
  touch $timestamp.ts

  # Copy the file over the network.
  rsync $timestamp.ts $1

  # Remove the local copy of the file.
  rm $timestamp.ts
  echo "success"

else

  echo  $1 " destination not found."

fi
