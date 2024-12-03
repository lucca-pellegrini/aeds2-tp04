#!/usr/bin/env sh

set -e

for d in [0-9][0-9].*/; do
	printf '%s\n' "Limpando ${d%/}:"
	make --no-print-directory -C "$d" clean | sed 's/^/\t/'
	echo
done
