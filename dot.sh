#!/bin/sh

DOTFILE=$1

cd

echo "Moving ~/.$DOTFILE to ~/dotfiles/$DOTFILE"
cp ~/.$DOTFILE ~/dotfiles/$DOTFILE

echo "Removing ~/.$DOTFILE"
rm ~/.$DOTFILE

echo "Make a symlink from ~/dotfiles/$DOTFILE to ~/.$DOTFILE"
ln -s ~/dotfiles/$DOTFILE ~/.$DOTFILE
