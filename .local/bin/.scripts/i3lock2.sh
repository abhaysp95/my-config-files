#!/usr/bin/env sh

# Author: Abhay Shanker Pathak
# Date: 2020-02-25
# Description: another lock screen script
# Email: abhaysp9955@gmail.com
# Github: https://github.com/CoolAbhayS
# Last Edited: 2020-02-25

screenshot=/tmp/screenshot.png
icon=$HOME/temp/download-removebg-preview.png

if [ -f "$screenshot" ]; then
	rm /tmp/screenshot.png
fi

scrot "$screenshot"

# add the lock icon to swirled and blurred image:
[[ -f "$icon" ]] &&
	convert "$screenshot" -quality 10 -paint 1 -sharpen 5x5 -colors 16 -swirl 180 "$screenshot"
	convert "$screenshot" -gravity center "$icon" -composite -matte "$screenshot"

# pause music
mpc pause

# get it locked
i3lock -e -f -c 000000 -i "$screenshot"
