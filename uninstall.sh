#!/bin/sh

files=".tmux.conf .vimrc .zshrc"

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

# Remove Ghostty config symlink
ghostty_target="$HOME/Library/Application Support/com.mitchellh.ghostty/config"
ghostty_backup="$ghostty_target.bak"

if [ -L "$ghostty_target" ]; then
    rm "$ghostty_target"
    echo "Removed symlink $ghostty_target"
fi

if [ -e "$ghostty_backup" ]; then
    mv "$ghostty_backup" "$ghostty_target"
    echo "Restored $ghostty_target from backup"
fi
