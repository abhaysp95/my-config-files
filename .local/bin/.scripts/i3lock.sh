#!/usr/bin/env bash

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
	i3lock -n -i "$tmpbg" && mpc pause
	postlock
}

lock_run

#	i3lock_pid
# i3lock_pid() {
# 	if [ -n "$(pgrep i3lock.sh)" ]; then
# 		echo "i3lock still running $(date)"
# 	else
# 		echo "i3lock has stopped $(date)"
# 	fi
# }
