if type natls > /dev/null; then
	alias ll="natls --gdf -ln"
else
	alias ll="ls -alF"
fi

alias la="ls -A"
alias l="ls -CF"
