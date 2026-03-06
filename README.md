# Dotfiles

Personal dotfiles for macOS with Ghostty + tmux + vim + zsh.

## Setup

```sh
./install.sh   # symlink dotfiles to ~ and install TPM
./uninstall.sh # remove symlinks and restore backups
```

## What's included

| File | Purpose |
|------|---------|
| `.tmux.conf` | tmux configuration |
| `.vimrc` | Vim configuration |
| `.zshrc` | Zsh / Oh My Zsh configuration |

## tmux

**Prefix:** `Ctrl+B` (default)

### Shortcuts

| Keys | Action |
|------|--------|
| `prefix + c` | New window (same directory) |
| `prefix + "` | Split horizontally (same directory) |
| `prefix + %` | Split vertically (same directory) |
| `prefix + r` | Reload tmux config |
| `Ctrl+H/J/K/L` | Navigate panes (works across vim splits) |
| `prefix + H/J/K/L` | Resize panes (repeatable) |
| `Shift+Enter` | Send CSI u sequence (for Claude Code etc.) |

### Features

- Mouse enabled (scroll, select panes, resize)
- Vi copy mode with mouse selection auto-copied to system clipboard
- OSC 8 hyperlink passthrough for Ghostty
- Window titles show current directory name
- Status bar updates every 1s

### Plugins (via TPM)

- [tmux-sensible](https://github.com/tmux-plugins/tmux-sensible) - sensible defaults
- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - seamless Ctrl+H/J/K/L between vim and tmux

### Tips

- **Open links in tmux:** Use `Cmd+Shift+click` (Ghostty requires Shift to bypass tmux mouse capture)
- **Install plugins:** `prefix + I` (capital i) after adding to config

## Vim

### Shortcuts

| Keys | Action |
|------|--------|
| `;` | Same as `:` (command mode) |
| `ii` | Exit insert mode |
| `j / k` | Move by visual line (wrapping-aware) |
| `Ctrl+H/J/K/L` | Navigate to tmux pane / vim split |
| `,w` | Window command prefix (`,w` then `s`, `v`, etc.) |
| `,cd` | cd to current file's directory |

### Settings

- Leader key: `,`
- Colorscheme: habamax
- 2-space soft tabs, expandtab
- System clipboard integration (`unnamed`)
- Case-insensitive search with highlighting
- Swap/backup files stored in `~/.vimswap` and `~/.vimbackup`

### Plugins (via vim-plug, auto-installed)

- [vim-tmux-navigator](https://github.com/christoomey/vim-tmux-navigator) - seamless pane/split navigation

## Zsh

- **Theme:** af-magic
- **Framework:** Oh My Zsh
- **Plugins:** git
- **Auto-starts tmux** on shell launch (each terminal gets its own session)

### Aliases

| Alias | Command |
|-------|---------|
| `ls` | `ls -1G` (one entry per line, colorized) |
| `fo` | Fuzzy find file and open it |
| `fvim` | Fuzzy find file and open in vim |
