#!/usr/bin/env bash
set -Eeuo pipefail

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
