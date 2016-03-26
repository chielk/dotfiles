#!/bin/sh

# Download and install Oh My Zsh
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh

git clone https://github.com/zsh-users/zsh-autosuggestions.git
mv zsh-autosuggestions ~/.oh-my-zsh/custom/plugins
mv zsh/agnoster.zsh-theme ~/.oh-my-zsh/custom/themes

# Put config files in their propec places
cp _zshrc ~/.zshrc
cp _gitconfig ~/.gitconfig
cp _vimrc ~/.vimrc
cp _tmux.conf ~/.tmux.conf
cp _Xmodmap ~/_Xmodmap

