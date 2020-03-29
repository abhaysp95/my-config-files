#!/usr/bin/env sh

rm /tmp/screenlock.png
#icon=$HOME/Pictures/fe8cd8608b7d3623802d9c7b6a912a2a-lock-icon-by-vexels.png
icon=$HOME/.cache/temp/download-removebg-preview.png
tmpbg='/tmp/screenlock.png'

(( $# )) && { icon=$1; }

scrot "$tmpbg"
convert "$tmpbg" -scale 10% -scale 1000% "$tmpbg"
convert "$tmpbg" -gravity center "$icon" -composite -matte "$tmpbg"
i3lock -i "$tmpbg"
