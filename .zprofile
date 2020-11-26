#!/bin/zsh

if [ -f $HOME/.profile ]; then
	emulate sh
	. ~/.profile
	emulate zsh
fi

. ~/.zsh_paths

