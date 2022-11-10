export TERM='xterm-256color'


# XDG
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$XDG_CONFIG_HOME/local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$XDG_CONFIG_HOME/cache}"


# editor
export EDITOR="nvim"
export VISUAL="nvim"


# Man pages
export MANPAGER='nvim +Man!'


# fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

FZF_COLORS="bg+:-1,\
fg:gray,\
fg+:white,\
border:black,\
spinner:0,\
hl:yellow,\
header:blue,\
info:green,\
pointer:red,\
marker:red,\
prompt:gray,\
hl+:red"

export FZF_DEFAULT_OPTS="--height 60% \
--border sharp \
--color='$FZF_COLORS' \
--prompt '∷ ' \
--pointer ▶ \
--marker ⇒"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -n 10'"


# PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$DOTFILES/bin:$PATH"

export DOCKER_HOST="unix://$XDG_RUNTIME_DIR/podman/podman.sock"
