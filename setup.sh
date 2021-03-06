#!/bin/zsh

# Set up zsh
git clone --recursive https://github.com/chielk/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh

# Set up vim
mkdir -p ~/.vim/bundle
mkdir -p ~/.vim/undo
mkdir -p ~/.vim/backup
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir -p ~/.config/i3/

# Put config files in their proper places
cp _gitconfig ~/.gitconfig
cp _vimrc ~/.vimrc
cp _tmux.conf ~/.tmux.conf
cp _Xmodmap ~/.Xmodmap
cp _Xresources ~/.Xresources
cp _i3config ~/.config/i3/config
