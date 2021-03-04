HISTSIZE=50000
SAVEHIST=50000

if [ -z $HISTFILE ]; then
	export HISTFILE=$HOME/.zsh_history
fi
