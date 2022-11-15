#!/usr/bin/env bash

. $DOTS/dmenu/dmenurc

screenlayout_path="$HOME/.screenlayout"
dmenu_exec=$(echo -e "aoc\nblackfoot\ndefault" | dmenu -p screenlayout $DMENU_OPTIONS)

case "$dmenu_exec" in
	aoc) sh $screenlayout_path/aoc.sh & ;;
	blackfoot) sh $screenlayout_path/blackfoot.sh & ;;
	default) sh $screenlayout_path/default.sh & ;;
esac
