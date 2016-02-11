#!/bin/bash
# Bash script to setup all the dotfiles

# setup vim
mkdir ~/.vimswap
mkdir ~/.vimbackup
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/dotfiles/UltiSnips ~/.vim/UltiSnips
rm ~/.vimrc
cd # go back to home directory
ln -s dotfiles/.vimrc

# setup bash
rm  ~/.bashrc
rm  ~/.bash_profile
rm  ~/.inputrc
cd
ln -s dotfiles/.bashrc
ln -s dotfiles/.bash_profile
ln -s dotfiles/.inputrc

# setup tmux
rm  ~/.tmux.conf
ln -s dotfiles/.conf ~/.tmux.conf
