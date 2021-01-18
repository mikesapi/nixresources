#! /bin/bash -e

echo "Trying to add tools path to .bash_profile.."

if grep -q toooools "$HOME/.bash_profile"; then
  echo toooools already exists
else
  echo "" >> ~/.bash_profile
  echo "toooools=$PWD" >> ~/.bash_profile
  echo "if [ -d \"\$toooools\" ] ; then" >> ~/.bash_profile
  echo "PATH=\"\$PATH:\$toooools\"" >> ~/.bash_profile
  echo "fi" >> ~/.bash_profile
  echo "success"
fi

echo "Making sure bash_profile is sourced by bashrc.."

if grep -q 'source ~/.bash_profile' "$HOME/.bashrc"; then
  echo bashrc already sourcing bash_profile
else
  echo "" >> ~/.bashrc
  echo "if [ -f ~/.bash_profile ]; then" >> ~/.bashrc
  echo "source ~/.bash_profile" >> ~/.bashrc
  echo "fi" >> ~/.bashrc
  echo "success"
fi
