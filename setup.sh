#!/bin/bash
echo 'value=$(<~/dotfiles/bashrc_add)' >> ~/.bashrc
echo 'eval "$value"' >> ~/.bashrc
