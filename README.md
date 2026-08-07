# Dotfiles

Personal dotfiles for macOS with Ghostty + tmux + vim + zsh.

## Setup

```sh
./install.sh   # install dependencies, symlink dotfiles to ~, install TPM
./uninstall.sh # remove symlinks and restore backups
```

The install script will prompt to install missing dependencies (`tmux`, `vim`, `bat`, `fzf`) via Homebrew.

## What's included

| File | Purpose |
|------|---------|
| `ghostty_config` | Ghostty terminal config (`~/Library/Application Support/com.mitchellh.ghostty/config`) |
| `.tmux.conf` | tmux configuration |
| `.vimrc` | Vim configuration |
| `.zshrc` | Zsh / Oh My Zsh configuration |

## Ghostty

| Setting | Value |
|---------|-------|
| `Cmd+`` ` | Toggle quick terminal (global hotkey) |
| `desktop-notifications` | Enabled (for Claude Code etc.) |
| `term` | `xterm-ghostty` (enables proper terminfo, CSI u support in tmux) |
| `initial-window` | `false` (no window on launch — quick terminal only) |

## tmux

**Prefix:** `Ctrl+B` (default)

### Shortcuts

| Keys | Action |
|------|--------|
| `prefix + c` | New window (same directory) |
| `prefix + "` | Split horizontally (same directory) |
| `prefix + %` | Split vertically (same directory) |
| `prefix + r` | Reload tmux config |
| `prefix + ,` | Rename current window (sticks until reset) |
| `Ctrl+H/J/K/L` | Navigate panes (works across vim splits) |
| `prefix + H/J/K/L` | Resize panes (repeatable) |

### Features

- Mouse enabled (scroll, select panes, resize)
- Vi copy mode with mouse selection auto-copied to system clipboard
- OSC 8 hyperlink passthrough for Ghostty
- Extended keys (CSI u) enabled for Ghostty — proper modifier key support
- Escape sequence passthrough enabled (desktop notifications, etc.)
- Window status shows `#I:#W` — manual rename via `prefix + ,`, otherwise folder basename
- Status bar updates every 1s
- Left status widened to 40 chars so session names aren't truncated

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
- **PATH:** `~/.local/bin` prepended (Hermes Agent and other user-local binaries)

### Aliases

| Alias | Command |
|-------|---------|
| `ls` | `ls -1G` (one entry per line, colorized) |
| `cat` | `bat` (syntax-highlighted cat replacement) |
| `fo` | Fuzzy find file and open it |
| `fvim` | Fuzzy find file and open in vim |
