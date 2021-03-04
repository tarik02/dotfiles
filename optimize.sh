#!/usr/bin/env bash

set -e

for i in $(find inc -type d); do
	if [ "$i" = 'inc' ]; then
		continue
	fi

	i=${i#"inc/"}

	cat inc/$i/* > inc/$i.merged
	echo "+ inc/$i.merged"
done
