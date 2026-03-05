# Dotfiles repo — symlinked config files for macOS (Ghostty + tmux + vim + zsh).

## Structure

- `.tmux.conf`, `.vimrc`, `.zshrc` — config files symlinked to ~ via install.sh
- `install.sh` / `uninstall.sh` — setup and teardown scripts
- `README.md` — documents all shortcuts, settings, and tips

## Rules

- When modifying any config file (.tmux.conf, .vimrc, .zshrc) or install/uninstall scripts,
  update README.md to reflect the changes (shortcuts, settings, aliases, plugins, tips).
- Keep README.md concise — use tables for shortcuts/aliases, no verbose prose.
