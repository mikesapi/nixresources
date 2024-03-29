#! /bin/bash -e

vimsetup=$(pwd)

# Install Vim
vimversion=v8.2.0000
softwaredir=$HOME/software
if [ ! -d $softwaredir/vim/.git ]; then
  echo "Installing vim $vimversion"
  mkdir -p $softwaredir
  git clone https://github.com/vim/vim.git $softwaredir/vim
  cd $softwaredir/vim
  git checkout $vimversion
  git am $vimsetup/vim81.patch
  vimflags=""
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    vimflags="$vimflags --with-x"
  fi
  echo "using vim configure flags: $vimflags"
  ./configure $vimflags
  make -j4
  sudo make install
  cd $vimsetup
else
  echo "$software/vim/.git already present, skipping installation of vim.."
fi

dest=$HOME
vimdir=.vim

if [ -f $dest/.vimrc ]; then
  echo "A .vimrc file already exists, exiting.."
  echo "Delete or move .vimrc before running this script"
  exit
fi

if [ -f $dest/.ctags ]; then
  echo "A .ctags file already exists, exiting.."
  echo "Delete or move .vimrc before running this script"
  exit
fi

if [ -d $dest/$vimdir ]; then
  echo "A ~/.vim folder already exists, exiting.."
  echo "Delete or move .vim before running this script"
  exit
fi

echo "Copying vimrc to ~/.vimrc"
cp vimrc $dest/.vimrc

echo "Installing local ctags settings.."
cp ctagsLocal $dest/.ctags

echo "Installing vim pathogen and packages.."
cd $dest
git clone https://github.com/tpope/vim-pathogen.git $vimdir
cd $vimdir
mkdir -p bundle && cd bundle

git clone https://github.com/dkprice/vim-easygrep.git
git clone https://github.com/fholgado/minibufexpl.vim.git
git clone https://github.com/scrooloose/nerdtree.git
git clone https://github.com/ervandew/supertab.git
git clone https://github.com/ericcurtin/CurtineIncSw.vim.git
git clone https://github.com/w0rp/ale.git
git clone https://github.com/christoomey/vim-tmux-navigator.git
git clone https://github.com/vimwiki/vimwiki.git

git clone https://github.com/heavenshell/vim-pydocstring
cd vim-pydocstring
git am $vimsetup/vim-pydocstring.patch
make install
cd ..

echo "Installing ftplugins.."
mkdir -p $dest/$vimdir/ftplugin
echo $vimsetup/python.vim
cp $vimsetup/python.vim $dest/$vimdir/ftplugin/
echo $vimsetup/cpp.vim
cp $vimsetup/cpp.vim $dest/$vimdir/ftplugin/

echo "done!"

