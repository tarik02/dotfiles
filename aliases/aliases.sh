_has_cmd() {
  command -v $1 >/dev/null 2>&1
}

alias g='git'
alias y='yarn'

alias open='open_command'
alias o='open'
alias oo='open .'

alias sudo='sudo '
alias _='sudo -E'

alias q='~ && clear'

alias e="$EDITOR"

alias x="chmod +x"

alias path='echo -e ${PATH//:/\\n}'

if _has_cmd bat; then
    alias cat='bat'
fi
