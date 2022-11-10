ask_yn() {
    echo "$1 [yes]"
    read -p "> " choice
    [[ ${REPLY:-y} =~ ^[Yy]$ ]] || return 1
}

function cmd_exists() {
    command -v $1 >/dev/null
}
