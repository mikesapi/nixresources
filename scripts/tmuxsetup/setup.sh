#! /bin/bash -e

tmuxsetup=$(pwd)
dest=$HOME
tmuxdir=.tmux

if [ -d $dest/$tmuxdir ]; then
  echo "A ~/.tmux folder already exists, exiting.."
  echo "Delete or move .tmux before running this script"
  exit
fi

if [ -f $dest/.tmux.conf ]; then
  echo "A .tmux.conf file already exists, exiting.."
  echo "Delete or move .tmux.conf before running this script"
  exit
fi

echo "Copying tmux.conf to ~/.tmux.conf"
cp tmux.conf $dest/.tmux.conf

echo "Installing tmux package manager.."
cd $dest
git clone https://github.com/tmux-plugins/tpm $dest/.tmux/plugins/tpm

# On launching tmux for the first time:
# Press prefix + I (capital i, as in Install) to fetch the plugin.
# Make sure you've actually saved a session (prefix + ctrl-s) before trying to restore (prefix + ctrl-r).
