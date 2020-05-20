#!/usr/bin/env sh

# Author: Abhay Shanker Pathak
# Date: 2020-02-23
# Description: testing music
# Email: abhaysp9955@gmail.com
# Github: https://github.com/CoolAbhayS
# Last Edited: 2020-02-23

if [ -n "$(pidof mpd)" ]; then
	# sourcing fading.sh, also can use source fading.sh
	# or also can write it as normal command since fading.sh is in $PATH
	. fading.sh
else
	if [ -n "$(pidof cmus)" ]; then
		cmus-remote -u && notify-send --icon=~/.cache/notify-icons/speaker.png -t 3000 "Music played/paused\nCurrent Song" "$(cmus-remote -Q | head -n 2 | grep file | cut -c 22-)"
	else
		dunstify "cmus not running"
	fi
fi
