#!/usr/bin/env bash
set -Eeuo pipefail

DOTFILES="${DOTFILES:="$HOME/.dotfiles"}"

mkdir -p "$DOTFILES/.local/bin"

ask_yn() {
    echo "$1 [yes]"
    read -p "> " choice
    [[ ${REPLY:-y} =~ ^[Yy]$ ]] || return 1
}

if ask_yn "Install starship.rs? (https://starship.rs/install.sh)"; then
    curl -sS https://starship.rs/install.sh | sh -s -- --force --bin-dir "$DOTFILES/.local/bin"
fi

if ask_yn "Install/update fzf? (https://github.com/junegunn/fzf)"; then
    if [ -d ~/.fzf ]; then
        git --git-dir ~/.fzf/.git pull
    else
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    fi
    "$DOTFILES/.local/fzf/install" --no-update-rc
fi
