#!/usr/bin/env bash

set -e

for i in $(find inc -type f -name '*.merged'); do
	rm $i
	echo "- $i"
done
