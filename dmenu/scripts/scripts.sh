#!/usr/bin/env bash

. $DOTS/dmenu/dmenurc

scripts_path="$DOTS/dmenu/scripts"
dmenu_exec=$(echo -e "screenlayout" | dmenu -p scripts $DMENU_OPTIONS)

case "$dmenu_exec" in
	screenlayout) sh $scripts_path/screenlayout.sh & ;;
esac
