if [ ! -z $TOUCHBAR_ENABLED ]; then

touchbar_keys=('^[OP' '^[OQ' '^[OR' '^[OS' '^[[15~' '^[[17~' '^[[18~' '^[[19~' '^[[20~' '^[[21~' '^[[23~' '^[[24~')

function touchbar_print_key() {
	echo -ne $*
}

function touchbar_remove_keys() {
	touchbar_print_key "\033]1337;PopKeyLabels\a"
}

function touchbar_unbind_keys() {
	for key in "$touchbar_keys[@]"; do
		bindkey -s "$key" ''
	done
}

function touchbar_remove_and_unbind_keys() {
	touchbar_remove_keys
	touchbar_unbind_keys
}

function touchbar_create_key() {
	touchbar_print_key "\033]1337;SetKeyLabel=F${1}=${2}\a"

	key=$1
	shift 2

	bindkey -s $touchbar_keys[$key] "$@"
}


touchbar_remove_and_unbind_keys

touchbar_create_key 1 'clear' 'clear\n'
touchbar_create_key 2 'reset' 'reset\n'
touchbar_create_key 3 'repeat with sudo' 'sudo !!\n\n'
touchbar_create_key 4 'list' 'll\n'
touchbar_create_key 5 'fuck' 'fuck\n'

fi
