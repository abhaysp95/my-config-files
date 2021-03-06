#!/usr/bin/env sh

message() {
	printf "%s\n\n\n%s\n%s" "$(mpc)" "🎜  Music dir stats" "$(mpc stats)"
}

notify-send -t 4000 --icon=~/.cache/notify-icons/music.png "Music Status" "$(message)"
# 🎜
