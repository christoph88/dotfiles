#!/bin/bash 

# create symbolic links
ln -sv ~/.dotfiles/.bashrc ~
ln -sv ~/.dotfiles/.inputrc ~
ln -sv ~/.dotfiles/.vimrc ~
ln -sv ~/.dotfiles/.tmux.conf ~

# create vim swap and backup directory
mkdir ~/.vimswap
mkdir ~/.vimbackup

