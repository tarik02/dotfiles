#!/bin/zsh

if [ -f $HOME/.profile ]; then
	emulate sh
	. ~/.profile
	emulate zsh
fi

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"

##export PATH="/usr/local/opt/php/bin:$PATH"

export HAXE_STD_PATH="/usr/local/lib/haxe/std"

alias ll="ls -alF"
alias la="ls -A"
alias l="ls -CF"

alias z="j"

alias artisan="php artisan"
alias art="artisan"

alias _="sudo"

function swap {
	tmp=$(mktemp)
	mv $1 $tmp
	mv $2 $1
	mv $tmp $2
}

alias dsstore="find . -name '*.DS_Store' -type f -ls -delete"
alias grep='grep --color=auto '
alias ls='ls -G '

function start {
	(nohup $@ </dev/null >/dev/null 2>&1 &) >/dev/null 2>&1
}

function crun {
	if [ -f "$1" ]; then
		filename="$1"
	else
		filename=$(find . -maxdepth 1 -type f \( -iname \*.c -o -iname \*.cpp \) | head -1)
	fi
	extension="${filename##*.}"
	name="${filename%.*}"

	if [[ $extension == 'c' ]]; then
		clang -std=c11 -lm $filename -o "$name.out" && clear && "./$name.out"
	else
		clang++ -std=c++17 -lm $filename -o "$name.out" && clear && "./$name.out"
	fi
}

[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
