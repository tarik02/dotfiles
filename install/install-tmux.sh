if [ ! -d "$XDG_CONFIG_HOME/tmux" ]; then
    mkdir "$XDG_CONFIG_HOME/tmux"
    ln -sf "$DOTFILES/tmux/tmux.conf" "$XDG_CONFIG_HOME/tmux"
    git clone https://github.com/tmux-plugins/tpm "$XDG_CONFIG_HOME/tmux/plugins/tpm"
fi
