#! /bin/bash -e

echo "Trying to add tools path to .bashrc"

if grep -q toooools "$HOME/.bashrc"; then
  echo toooools already exists
else
  echo "" >> ~/.bashrc
  echo "toooools=$PWD" >> ~/.bashrc
  echo "if [ -d \"\$toooools\" ] ; then" >> ~/.bashrc
  echo "PATH=\"\$PATH:\$toooools\"" >> ~/.bashrc
  echo "fi" >> ~/.bashrc
  echo "success"
fi
