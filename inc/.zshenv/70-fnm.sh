if [ -f /usr/local/bin/fnm ]; then
	eval "$(/usr/local/bin/fnm env)"
elif [ -f $HOME/.fnm/fnm ]; then
	eval "$($HOME/.fnm/fnm env)"
elif [ -f /opt/homebrew/bin/fnm ]; then
	eval "$(/opt/homebrew/bin/fnm env)"
fi
