#!/usr/bin/env bash

set -e

git pull

source ./.env

$DFI_ROOT/install/dotfiles.sh
$DFI_ROOT/install/afterparty.sh

$DFI_ROOT/deoptimize.sh
$DFI_ROOT/optimize.sh

