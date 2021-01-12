#!/bin/zsh

. $HOME/.zsh_paths

if [ -f $HOME/.env ]; then
	. $HOME/.env
fi

[[ -s "$HOME/.xmake/profile" ]] && source "$HOME/.xmake/profile" # load xmake profile

source "$HOME/.cargo/env"
