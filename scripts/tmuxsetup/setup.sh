#! /bin/bash -e

tmuxsetup=$(pwd)
dest=$HOME
tmuxdir=.tmux

if [ -d $dest/$tmuxdir ]; then
  echo "A ~/.tmux folder already exists, exiting.."
  echo "Delete or move .tmux before running this script"
  exit
fi

if [ -f $dest/.tmux.conf.local ]; then
  echo "A .tmux.conf.local file already exists, exiting.."
  echo "Delete or move .tmux.conf before running this script"
  exit
fi

if [ -f $dest/.tmux.conf ]; then
  echo "A .tmux.conf file already exists, exiting.."
  echo "Delete or move .tmux.conf before running this script"
  exit
fi

echo "Copying tmux.conf to ~/.tmux.conf"
cd $dest
git clone https://github.com/gpakosz/.tmux.git
ln -s -f .tmux/.tmux.conf
cp $tmuxsetup/tmux.conf.local .tmux.conf.local
