#!/usr/bin/env bash
set -Eeuo pipefail

. ./lib/colors.sh
. ./lib/fns.sh
. ./lib/doctor.sh

doctor_init


set +e

doctor_check_err 'zsh' 'cmd_exists zsh'
doctor_check_err 'git' 'cmd_exists git'
doctor_check_warn 'fzf' 'cmd_exists fzf'
doctor_check_warn 'starship' 'cmd_exists starship'
doctor_check_warn 'bat' 'cmd_exists bat'
doctor_check_warn 'tmux' 'cmd_exists tmux'
doctor_check_warn 'direnv' 'cmd_exists direnv'
doctor_check_warn 'mise' 'cmd_exists mise'

set -e

doctor_finish
