if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach -t default || tmux new -s default
fi

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# Load my system dotfiles
source .alias
source .env
source .functions
source .prompt
