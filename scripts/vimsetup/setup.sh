#! /bin/bash -e

dest=$HOME
vimdir=.vim

if [ -d $dest/$vimdir ]; then
  echo "A ~/.vim folder already exists, exiting.."
  echo "Delete or move .vim before running this script"
  exit
fi

if [ -f $dest/.vimrc ]; then
  echo "A .vimrc file already exists, exiting.."
  echo "Delete or move .vimrc before running this script"
  exit
fi

echo "Copying vimrc to ~/.vimrc"
cp vimrc ~/.vimrc

echo "Installing vim pathogen and packages.."
cd $dest
git clone https://github.com/tpope/vim-pathogen.git $vimdir
cd $vimdir
mkdir -p bundle && cd bundle

git clone https://github.com/dkprice/vim-easygrep.git
git clone https://github.com/vim-scripts/minibufexpl.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/ericcurtin/CurtineIncSw.vim.git

echo "done!"

