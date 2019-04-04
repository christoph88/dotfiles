#!/bin/bash 

# create symbolic links
ln -sv ~/.dotfiles/.bash_profile ~
ln -sv ~/.dotfiles/.inputrc ~
ln -sv ~/.dotfiles/.tmux.conf ~
ln -sv ~/.dotfiles/.vimrc ~

# create .bash profile extensions symbolic links
ln -sv ~/.dotfiles/system/.alias ~
ln -sv ~/.dotfiles/system/.env ~
ln -sv ~/.dotfiles/system/.functions ~
ln -sv ~/.dotfiles/system/.prompt ~

# create vim swap and backup directory
mkdir ~/.vimbackup
mkdir ~/.vimswap
