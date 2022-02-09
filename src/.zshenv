DFI_INC() {
	if [ -f "$DFI_ROOT/inc/$1.merged" ]; then
		source "$DFI_ROOT/inc/$1.merged"
	else
		source <(cat "$DFI_ROOT/inc/$1"/*)
	fi
}

if [ -f "$DFI_HOME/.env" ]; then
	source "$DFI_HOME/.env"
fi

if [ -d $DFI_HOME/.env.d && ! -z $(ls -A $DFI_HOME/.env.d) ]; then
	source $DFI_HOME/.env.d/*
fi

DFI_INC .zshenv
DFI_INC .zsh_paths
