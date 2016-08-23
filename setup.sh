#/bin/bash

ln -s ~/.dotfiles/bashrc ~/.bashrc 
ln -s ~/.dotfiles/gitconfig ~/.gitconfig 
ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global 

ls -al | grep "\->"