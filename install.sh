#!/usr/bin/env bash

set -e

./mkenv.sh
source ./.env

rm -rf $DFI_THIRDPARTY/*
echo -n > $DFI_THIRDPARTY/.gitkeep

$DFI_ROOT/install/packages.sh
$DFI_ROOT/install/dotfiles.sh
$DFI_ROOT/install/afterparty.sh

$DFI_ROOT/optimize.sh
