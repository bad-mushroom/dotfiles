#/bin/bash

ln -s ~/.dotfiles/bashrc ~/.bashrc 
ln -s ~/.dotfiles/gitconfig ~/.gitconfig 
ln -s ~/.dotfiles/gitignore_global ~/.gitignore_global 
ln -s ~/.dotfiles/vimrc ~/.vimrc 


ls -al | grep "\->"