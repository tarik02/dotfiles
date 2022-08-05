bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word

bindkey "^[[H" beginning-of-line
bindkey "^[[1~" beginning-of-line
bindkey "^[[F" end-of-line
bindkey "^[[4~" end-of-line

bindkey "^[[5~" "beginning-of-buffer-or-history" # pageup
bindkey "^[[6~" "end-of-buffer-or-history" # pagedown
bindkey -s "^[[2~" "" # insert

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
#bindkey "$key[Up]" up-line-or-beginning-search
#bindkey "$key[Down]" down-line-or-beginning-search

# macOS
bindkey '^[b' backward-word
bindkey '^[f' forward-word

bindkey '^[[3~' delete-char

