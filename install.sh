#!/usr/bin/env bash
set -Eeuo pipefail

export DOTFILES_INSTALLING=1

git submodule init
git submodule update

if [ -d /opt/homebrew/bin ]; then
    export PATH="/opt/homebrew/bin:$PATH"
fi

. ./lib/colors.sh
. ./lib/fns.sh

doctor_status=0
./doctor.sh || doctor_status=$?

case $doctor_status in
    0 | 1)
        ;;

    *)
        printf "${red}Aborting installation${default}\n"
        exit 1
esac

ask_yn "Proceed to installation?" || exit 1

. ./zsh/zshenv

. ./install/install-zsh.sh
. ./install/install-git.sh
command -v tmux >/dev/null && . ./install/install-tmux.sh
command -v direnv >/dev/null && . ./install/install-direnv.sh

mkdir -p "$DOTFILES/custom"
for i in "$DOTFILES/custom.gen"/*.sh; do
    out="$DOTFILES/custom/$(basename "${i%.sh}")"

    if [ -e "$out" ]; then
        if ! ask_yn "Replace $out?" no; then
            continue
        fi
    fi

    . "$i" > "$out.tmp"
    mv "$out.tmp" "$out"
done
