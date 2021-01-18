#! /bin/bash -e

# Install zsh
install-packages.sh \
zsh \
powerline \
fonts-powerline

# Install Oh-My Zsh
sh -c "$(wget -O- https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
