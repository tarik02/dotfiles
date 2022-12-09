#!/usr/bin/env zsh

if [ -f "$HOME/.fzf.zsh" ]; then
    source "$HOME/.fzf.zsh"
else
    [ -f /usr/share/fzf/completion.zsh ] && source /usr/share/fzf/completion.zsh
    [ -f /usr/share/fzf/key-bindings.zsh ] && source /usr/share/fzf/key-bindings.zsh
fi

_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd)           find . -type d | fzf --height 50% --border sharp --margin 5% --preview 'tree -C {} | head -n 10';;
        *)            fzf "$@" ;;
    esac
}
