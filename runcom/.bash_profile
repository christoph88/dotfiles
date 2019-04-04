for DOTFILE in `find /Users/lars/Projects/.dotfiles`
do
  [ -f “$DOTFILE” ] && source “$DOTFILE”
done
