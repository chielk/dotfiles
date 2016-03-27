#!/bin/zsh

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
  ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done
chsh -s /bin/zsh

# Put config files in their propec places
cp _gitconfig ~/.gitconfig
cp _vimrc ~/.vimrc
cp _tmux.conf ~/.tmux.conf
cp _Xmodmap ~/_Xmodmap

