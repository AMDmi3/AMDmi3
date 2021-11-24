#!/bin/sh

size="240x180"

for i in ../images/*.png; do
	o=$(basename "$i")
	if [ ! -e "$o" -o "$i" -nt "$o" -o "$0" -nt "$o" ]; then
		echo "$i → $o"
		convert "$i" -resize "$size^" -gravity Center -extent "$size" "$o"
		optipng -quiet -o99 "$o"
	fi
done
