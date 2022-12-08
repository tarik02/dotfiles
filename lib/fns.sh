ask_yn() {
    default="${2:-yes}"
    echo "$1 [$default]"
    read -p "> " choice
    [ -n "$choice" ] || choice="$default"
    [[ "$choice" =~ ^[Yy] ]] || return 1
}

function cmd_exists() {
    command -v $1 >/dev/null
}
