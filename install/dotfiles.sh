#!/usr/bin/env bash

set -e

echo "source '$DFI_ROOT/.env'" > $DFI_HOME/.zshenv
echo "source '$DFI_ROOT/src/.zshenv'" >> $DFI_HOME/.zshenv

for i in $(find $DFI_ROOT/src -path '*/.*' -type f -print); do
	i=${i#"$DFI_ROOT/src/"}

	if [ "$i" = '.zshenv' ]; then
		continue
	fi

	dir="$(dirname $i)"

	if [ ! "$dir" = '.' ]; then
		mkdir -p "$DFI_HOME/$dir"
	fi

	ln -sf "$DFI_ROOT/src/$i" "$DFI_HOME/$i"
done
