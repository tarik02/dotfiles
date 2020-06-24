#!/bin/zsh

if [ -f $HOME/.profile ]; then
	emulate sh
	. ~/.profile
	emulate zsh
fi

if [ -f $HOME/.env ]; then
	source ~/.env
fi

export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

export PATH="$HOME/.bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"

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
		shift
	else
		filename=$(find . -maxdepth 1 -type f \( -iname \*.c -o -iname \*.cpp \) | head -1)
	fi
	extension="${filename##*.}"
	name="${filename%.*}"

	if [[ $extension == 'c' ]]; then
		clang -std=c11 -lm "$@" $filename -o "$name.out" && clear && "./$name.out"
	else
		clang++ -std=c++17 -lm "$@" $filename -o "$name.out" && clear && "./$name.out"
	fi
}

function merge-to {
	target_branch="$1"
	shift

	branch_name=$(git symbolic-ref -q HEAD)
	branch_name=${branch_name##refs/heads/}
	branch_name=${branch_name:-HEAD}

	git checkout $target_branch && git merge $branch_name && git push && git checkout $branch_name
}

function hide-static {
	[[ -d .git ]] || return 1

	show-static

	echo '/static/' >> .git/info/exclude
	echo '/var/control/' >> .git/info/exclude

	return 0
}

function show-static {
	[[ -d .git ]] || return 1

	cp .git/info/exclude .git/info/exclude.bak
	cat .git/info/exclude.bak \
		| sed '/^\/static\/$/d' \
		| sed '/^\/var\/control\/$/d' \
		> .git/info/exclude
	rm .git/info/exclude.bak
}

function commit-static {
	[[ -d .git ]] || return 1

	message="${1:-build assets}"

	show-static

	git add static var
	git commit -m "$message"

	hide-static

	return 0
}

function laradock {
	if [ -z $LARADOCK_ROOT ]; then
		LARADOCK_ROOT=$HOME/Laradock
	fi

	if ! type python3 > /dev/null; then
		echo "This command requires python3 to be available."
		return 1
	fi

	if [[ "$1" == "init" ]]; then
		shift
		# git clone
		LARADOCK_ROOT="$LARADOCK_ROOT" python3 $LARADOCK_ROOT/cli.py init
		return $?
	fi

	if [ ! -d $LARADOCK_ROOT ] || [ ! -f $LARADOCK_ROOT/cli.py ]; then
		echo "Laradock is not initialized. Run \`laradock init\` to initialize laradock."
		return 1
	fi

	LARADOCK_ROOT="$LARADOCK_ROOT" python3 $LARADOCK_ROOT/cli.py "$@"
	return $?
}

[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
