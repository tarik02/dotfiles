#!/usr/bin/env bash

set -e

if type apt-get > /dev/null 2>&1; then
	# Ubuntu
	$DFI_ROOT/install/packages/apt-get.sh
elif type pacman > /dev/null 2>&1; then
	# Ubuntu
	$DFI_ROOT/install/packages/pacman.sh
fi

$DFI_ROOT/install/packages/common.sh
