#!/bin/bash -e

##
# This script only works if you have executed the script 'add-tools-path-to-bashrc.sh' in the tools directory,
# as it needs access to the following scripts:
# install-packages.sh
# permission-to-run.sh
# restart.sh
##

##
# This script is usually used following a fresh install.
# Before running this script, go to:
# Settings > Software and Updates > and enable partner repositories.
#
# Then:
# sudo apt-get install git
# git clone https://github.com/mikesapi/nixresources.git
# cd nixresources/scripts/tools
# ./add-tools-path-to-bashrc.sh
# source ~/.bashrc
# 
# cd ../installation
# ./install-essentials.sh
##

#echo "Updating and Upgrading..."
#sudo apt-get update && sudo apt-get upgrade

echo "Media codecs..."
install-packages.sh ubuntu-restricted-extras

echo "Extract and compress files in various formats..."
install-packages.sh zip unzip p7zip-full p7zip-rar sharutils

echo "Networking..."
install-packages.sh \
nfs-common \
nis \
openssh-server \
cifs-utils \
net-tools \
samba

echo "Adjust colour temperature of screen..."
install-packages.sh \
geoclue-2.0 \
redshift \
redshift-gtk

echo "Proprietary Microsoft format used on some sd-cards..."
install-packages.sh \
exfat-fuse \
exfat-utils

echo "Programming..."
install-packages.sh \
cmake \
cmake-curses-gui \
exuberant-ctags \
git gitg \
meld \
octave \
r-base-dev \
r-cran-ggplot2 \
vim \
python3-venv \
tmux \
xclip

echo "Required for compiling vim from source with --with-x support..."
install-packages.sh \
libx11-dev \
libice-dev \
libsm-dev \
libxtst-dev \
libxt-dev


echo "Other essential packages..."
install-packages.sh \
locate \
evince \
gimp gimp-data gimp-plugin-registry gimp-data-extras \
gnome-session-flashback \
gnome-system-tools \
gparted \
htop \
inkscape \
openshot \
rsync \
texlive-full \
trash-cli \
tree \
youtube-dl \
vlc

permission-to-run.sh 'Would you like to restart the system now? [y/N]' restart.sh
