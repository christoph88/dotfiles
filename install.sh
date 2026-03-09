#!/bin/sh

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"

files=".tmux.conf .vimrc .zshrc"

# Create directories required by .vimrc
mkdir -p "$HOME/.vimswap" "$HOME/.vimbackup"

# Install dependencies via Homebrew
deps="tmux vim bat fzf"
missing=""
for dep in $deps; do
    if ! command -v "$dep" >/dev/null 2>&1; then
        missing="$missing $dep"
    fi
done

if [ -n "$missing" ]; then
    echo "The following dependencies are missing:$missing"
    printf "Install them via Homebrew? [y/N] "
    read -r answer
    if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
        brew install $missing
    else
        echo "Skipping dependency installation"
    fi
else
    echo "All dependencies already installed"
fi

# Install TPM (Tmux Plugin Manager) if not already present
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
    echo "Installing TPM (Tmux Plugin Manager)..."
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
else
    echo "TPM already installed"
fi

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

# Symlink Ghostty config
ghostty_target="$HOME/Library/Application Support/com.mitchellh.ghostty/config"
ghostty_source="$DOTFILES_DIR/ghostty_config"
mkdir -p "$(dirname "$ghostty_target")"

if [ -e "$ghostty_target" ] && [ ! -L "$ghostty_target" ]; then
    echo "Backing up existing $ghostty_target to $ghostty_target.bak"
    mv "$ghostty_target" "$ghostty_target.bak"
fi

ln -sf "$ghostty_source" "$ghostty_target"
echo "Linked $ghostty_target -> $ghostty_source"
