#! /bin/bash -e
if [[ "$@" == "-m" ]]
then
  gitk --since="4 weeks ago" --all --author="\(Michael Sapienza\)\|\(mikesapi\)" &
else
  gitk --all &
fi


