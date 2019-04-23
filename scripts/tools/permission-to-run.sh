#!/bin/bash -e

function help {
  echo ""
  echo "Usage: ./permissiontorun \"Are you sure you want to run this?\" [command to run]"
  echo ""
}

if [ $# -ne 2 ]
then 
  help
  exit
fi

read -r -p "$1 " response 
if [[ $response =~ ^[Yy]$ ]]
then
  #echo $2
  eval "$2"
else
  exit
fi
