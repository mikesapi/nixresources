#! /bin/bash -e

dest=$HOME
if [ ! -d $dest/.oh-my-zsh ]; then
  echo "A ~/.oh-my-zsh folder does not exist, exiting.."
  echo "First run install_zsh.sh.."
  exit
fi


current_time=$(date "+%Y.%m.%d-%H.%M.%S")
if [ -f $dest/.zshrc ]; then
  mv $dest/.zshrc $dest/.zshrc_backup.$current_time
  echo "A .zshrc file already exists, creating a backup: zshrc_backup .."
fi

echo "Copying zshrc to ~/.zshrc"
cp zshrc $dest/.zshrc
