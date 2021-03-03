#!/bin/zsh

if grep -q microsoft /proc/version; then
	export IS_WSL=1
	. $HOME/.zshenv_wsl
else
	export IS_WSL=0
fi

if [ -f $HOME/.env ]; then
	. $HOME/.env
fi

. $HOME/.zsh_paths

[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile

[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

