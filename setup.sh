#!/bin/bash
echo 'value=$(<~/dotfiles/bashrc_add)' >> ~/.bashrcx
echo 'eval "$value"' >> ~/.bashrcx
