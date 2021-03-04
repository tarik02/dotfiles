function artisan {
	current_path="$(pwd)"

	while [[ "$current_path" != '/' && ! -e "$current_path/artisan" ]]; do
		current_path="$(dirname "$current_path")"
	done

	if [[ -e "$current_path/artisan" ]]; then
		php "$current_path/artisan" "$@"
		return $?
	else
		echo "Failed to find artisan" > /dev/stderr
		return -1
	fi
}

alias art="artisan"

alias dk="laradock"
