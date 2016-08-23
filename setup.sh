#/bin/bash

ln -s ~/.bashrc ~/.dotfiles/bashrc
ln -s ~/.gitconfig ~/.dotfiles/gitconfig
ln -s ~/.gitignore_global ~/.dotfiles/gitignore_global

ls -al | grep "\->"