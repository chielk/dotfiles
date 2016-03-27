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
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Put config files in their propec places
cp _gitconfig ~/.gitconfig
cp _vimrc ~/.vimrc
cp _tmux.conf ~/.tmux.conf
cp _Xmodmap ~/.Xmodmap

