#!/bin/sh

files=".tmux.conf .vimrc"

for file in $files; do
    target="$HOME/$file"
    backup="$target.bak"

    if [ -L "$target" ]; then
        rm "$target"
        echo "Removed symlink $target"
    fi

    if [ -e "$backup" ]; then
        mv "$backup" "$target"
        echo "Restored $target from backup"
    fi
done
