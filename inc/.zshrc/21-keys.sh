bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "^[^[[C" forward-word
bindkey "^[^[[D" backward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
#bindkey "$key[Up]" up-line-or-beginning-search
#bindkey "$key[Down]" down-line-or-beginning-search
