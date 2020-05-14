#!/usr/bin/env bash
#     _    ____  ____
#    / \  / ___||  _ \   Abhay Shanker Pathak
#   / _ \ \___ \| |_) |  abhaysp9955@gmail.com
#  / ___ \ ___) |  __/   https://github.com/coolabhays
# /_/   \_\____/|_|
#
# current lock screen script for my setup



lock_timeout=300
def_timeout="$(cut -d ' ' -f4 <<< $(xset q | sed -n '25p'))"
def_dpms="$(xset q | awk '/^[[:blank:]]*DPMS is/ {print $(NF)}')"

rm /tmp/screenlock.png
icon=$HOME/.cache/temp/download-removebg-preview.png
tmpbg='/tmp/screenlock.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" -gravity center "$icon" -composite -matte "$tmpbg"

prelock() {
	echo "in prelock $(date)"
	if [ -n "$lock_timeout" ]; then
		xset dpms "$lock_timeout"
	fi
	if [ -n "$(pidof dunst)" ]; then
		killall $(pidof dunst)
	fi
}

postlock() {
	dunst &
	echo "in postlock $(date)"
	if [ -n "$lock_timeout" ]; then
		xset -dpms
		# xset dpms "$def_timeout"
		# if [ "$def_dpms" = "Enabled" ]; then
		# fi
	fi
}

lock_run() {
	prelock
	mpc pause && i3lock -n -i "$tmpbg"
	postlock
}

lock_run
