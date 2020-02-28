#!/usr/bin/env sh

# Author: Abhay Shanker Pathak
# Date: 2020-02-26
# Description: Music seek backward 10 sec
# Email: abhaysp9955@gmail.com
# Github: https://github.com/CoolAbhayS
# Last Edited: 2020-02-26

if [ -n "$(pidof mpd)" ]; then
<<<<<<< HEAD
	mpc seek -60
	#&& notify-send --icon=audio-headphones -t 3000 "Music played/paused\nCurrent Song" "$(mpc | head -1)"
else
	if [ -n "$(pidof cmus)" ]; then
		cmus-remote -k -60
		#&& notify-send --icon=audio-headphones -t 3000 "Music played/paused\nCurrent Song" "$(cmus-remote -Q | head -n 2 | grep file | cut -c 22-)"
=======
	mpc seek -60 && notify-send --icon=audio-headphones -t 3000 "Music played/paused\nCurrent Song" "$(mpc | head -1)"
else
	if [ -n "$(pidof cmus)" ]; then
		cmus-remote -k -60 && notify-send --icon=audio-headphones -t 3000 "Music played/paused\nCurrent Song" "$(cmus-remote -Q | head -n 2 | grep file | cut -c 22-)"
>>>>>>> 01a4813608d0f2d2859517f52051bb5563d65a40
	else
		dunstify "cmus not running"
	fi
fi
