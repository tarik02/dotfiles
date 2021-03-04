#!/usr/bin/env bash

set -e

if [ -f /etc/lsb-release ]; then
	# Ubuntu
	$DFI_ROOT/install/packages/ubuntu.sh
fi

$DFI_ROOT/install/packages/common.sh
