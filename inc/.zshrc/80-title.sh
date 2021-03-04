function precmd {
	TITLE="$(basename $(pwd)) on $HOST"
	echo -ne $(print -Pn - '\e]0;$TITLE\a')
}

function preexec {
	COMMAND_FILE=$(echo $1 | cut -d' ' -f1)
	TITLE="$(basename $COMMAND_FILE) on $HOST"
	echo -ne $(print -Pn - '\e]0;$TITLE\a')
}
