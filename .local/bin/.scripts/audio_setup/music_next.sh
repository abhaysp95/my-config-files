#!/usr/bin/env sh

# Author: Abhay Shanker Pathak
# Date: 2020-02-26
# Description: Change songs prev and next(ncmpcpp and cmus)
# Email: abhaysp9955@gmail.com
# Github: https://github.com/CoolAbhayS
# Last Edited: 2020-02-26

if [ -n "$(pidof mpd)" ]; then
	mpc next && notify-send --icon=audio-headphones -t 3000 "Music played/paused\nCurrent Song" "$(mpc | head -1)"
else
	if [ -n "$(pidof cmus)" ]; then
		cmus-remote -n && notify-send --icon=audio-headphones -t 3000 "Music played/paused\nCurrent Song" "$(cmus-remote -Q | head -n 2 | grep file | cut -c 22-)"
	else
		dunstify "cmus not running"
	fi
fi

