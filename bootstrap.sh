#!/usr/bin/env bash
set -Eeuo pipefail

DOTFILES="${DOTFILES:="$HOME/.dotfiles"}"

mkdir -p "$DOTFILES/.local/bin"

. "$DOTFILES/lib/fns.sh"

if ask_yn "Install starship.rs? (https://starship.rs/install.sh)"; then
    curl -sS https://starship.rs/install.sh | sh -s -- --force --bin-dir "$DOTFILES/.local/bin"
fi

if ask_yn "Install/update fzf? (https://github.com/junegunn/fzf)"; then
    if [ -d "$DOTFILES/.local/fzf" ]; then
        (cd "$DOTFILES/.local/fzf" && git pull)
    else
        git clone --depth 1 https://github.com/junegunn/fzf.git "$DOTFILES/.local/fzf"
    fi
    "$DOTFILES/.local/fzf/install" --no-update-rc
fi
