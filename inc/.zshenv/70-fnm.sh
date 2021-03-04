if [ -f /usr/local/bin/fnm ]; then
	eval "$(/usr/local/bin/fnm env)"
elif [ -f $HOME/.fnm/fnm ]; then
	eval "$($HOME/.fnm/fnm env)"
fi
