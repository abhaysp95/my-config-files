#!/usr/bin/env bash

case "$1" in
	alternate)
		bspc config automatic_scheme alternate
		notify-send -t 2500 "layout_scheme" "alternate scheme set"
		exit 0;;
	longest_side)
		bspc config automatic_scheme longest_side
		notify-send -t 2500 "layout_scheme" "longest_side scheme set"
		exit 0;;
	spiral)
		bspc config automatic_scheme spiral
		notify-send -t 2500 "layout_scheme" "spiral scheme set"
		exit 0;;
esac
