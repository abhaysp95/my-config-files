#!/usr/bin/env bash
#     _    ____  ____
#    / \  / ___||  _ \   Abhay Shanker Pathak
#   / _ \ \___ \| |_) |  abhaysp9955@gmail.com
#  / ___ \ ___) |  __/   https://github.com/coolabhays
# /_/   \_\____/|_|
#
# play youtube/vimeo on mpv

notify-send -t 2500 'Playing Video' "$(xclip -o -selection clipboard)"
mpv --ytdl-format=22 --fs "$(xclip -o -selection clipboard)" \
	|| mpv --ytdl-format=18 --fs "$(xclip -o -selection clipboard)" \
	|| mpv --fs "$(xclip -o -selection clipboard)"
