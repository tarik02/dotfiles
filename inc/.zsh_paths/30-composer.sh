if [ -d $HOME/.composer ]; then
	export PATH="$HOME/.composer/vendor/bin:$PATH"
fi

if [ -d $HOME/.config/composer ]; then
	export PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi
