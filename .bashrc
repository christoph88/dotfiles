for DOTFILE in `find /Users/christophgeypen/.dotfiles/system`
do
  [ -f “$DOTFILE” ] && source “$DOTFILE”
done
