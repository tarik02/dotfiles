_has_cmd() {
  command -v $1 >/dev/null 2>&1
}

alias g='git'
alias y='yarn'

alias open='open_command'
alias o='open'
alias oo='open .'

alias sudo='sudo '
alias _='sudo -E '

if _has_cmd nvim; then
    alias vim='nvim'
    alias vi='nvim'
elif _has_cmd vim; then
    alias nvim='vim'
    alias vi='vim'
elif _has_cmd vi; then
    alias nvim='vi'
    alias vim='vi'
fi

alias q='~ && clear'

alias e="$EDITOR"

alias x="chmod +x"

alias path='echo -e ${PATH//:/\\n}'

alias svc='systemctl --user'
alias svc-edit='systemctl --user edit --force --full'
alias logs='journalctl --user'

if _has_cmd bat; then
    alias cat='bat -pP'
fi


function artisan {
    current_path="$(pwd)"

    while [[ "$current_path" != '/' && ! -e "$current_path/artisan" ]]; do
        current_path="$(dirname "$current_path")"
    done

    if [[ -e "$current_path/artisan" ]]; then
        php "$current_path/artisan" "$@"
        return $?
    else
        >&2 echo "Failed to find artisan"
        return 1
    fi
}

alias art="artisan"

[ -f "$DOTFILES/custom/aliases.sh" ] && . "$DOTFILES/custom/aliases.sh"
