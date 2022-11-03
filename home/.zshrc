export DOTFILES=${DOTFILES:="$HOME/.dotfiles"}

. "$DOTFILES/lib/env.shell.sh"

[ -f "$DOTFILES/.local/bin/starship" ] && eval "$("$DOTFILES/.local/bin/starship" init zsh)"
