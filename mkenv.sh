#!/usr/bin/env bash

set -e

DFI_ROOT="$(pwd)"
DFI_THIRDPARTY="$DFI_ROOT/thirdparty"
DFI_HOME="$HOME"
DFI_CACHE="$DFI_ROOT/.cache"

echo -n > $DFI_ROOT/.env
chmod +x $DFI_ROOT/.env

echo "export DFI_ROOT='$DFI_ROOT'" >> $DFI_ROOT/.env
echo "export DFI_THIRDPARTY='$DFI_THIRDPARTY'" >> $DFI_ROOT/.env
echo "export DFI_HOME='$DFI_HOME'" >> $DFI_ROOT/.env
echo "export DFI_CACHE='$DFI_CACHE'" >> $DFI_ROOT/.env

echo 'mkdir -p $DFI_CACHE' >> $DFI_ROOT/.env

echo 'Generated env:'
cat $DFI_ROOT/.env
