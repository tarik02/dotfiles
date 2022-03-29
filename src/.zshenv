DFI_INC() {
	if [ -f "$DFI_ROOT/inc/$1.merged" ]; then
		source "$DFI_ROOT/inc/$1.merged"
	else
		for f in "$DFI_ROOT/inc/$1"/*(N); do
			source "$f"
		done
	fi
}

if [ -f "$DFI_HOME/.env" ]; then
	source "$DFI_HOME/.env"
fi

if [[ -d $DFI_HOME/.env.d && ! -z $(ls -A $DFI_HOME/.env.d) ]]; then
	for f in "$DFI_HOME/.env.d"/*(N); do
		source $f
	done
fi

DFI_INC .zshenv
DFI_INC .zsh_paths
