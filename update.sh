#!/bin/sh

echo -n "Copying files..."
cp ~/.gitconfig _gitconfig
cp ~/.vimrc _vimrc
cp ~/.tmux.conf _tmux.conf
cp ~/.Xmodmap _Xmodmap
cp ~/.Xresources _Xresources
cp ~/.config/i3/config _i3config
echo " done"
