#!/bin/sh

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

files=".tmux.conf .vimrc .zshrc"

# Create directories required by .vimrc
mkdir -p "$HOME/.vimswap" "$HOME/.vimbackup"

for file in $files; do
    target="$HOME/$file"
    source="$DOTFILES_DIR/$file"

    if [ -e "$target" ] && [ ! -L "$target" ]; then
        echo "Backing up existing $target to $target.bak"
        mv "$target" "$target.bak"
    fi

    ln -sf "$source" "$target"
    echo "Linked $target -> $source"
done
