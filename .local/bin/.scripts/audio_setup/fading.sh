#!/usr/bin/env bash
#     _    ____  ____
#    / \  / ___||  _ \   Abhay Shanker Pathak
#   / _ \ \___ \| |_) |  abhaysp9955@gmail.com
#  / ___ \ ___) |  __/   https://github.com/coolabhays
# /_/   \_\____/|_|
#
# fading effect with mpc

vol="$(mpc volume | cut -c 8-10)"
step=$((vol/10))
stat=$(mpc | sed -n '2 p' | cut -d '[' -f 2 | cut -d ']' -f 1)
# echo "$stat"
if [[ $stat == "paused" ]]; then
	mpc volume 0;
	sleep 0.3
	mpc play >/dev/null
	for i in {1..10}; do
		mpc volume +$step >/dev/null;
		sleep 0.2
	done
elif [[ $stat == "playing" ]]; then
	for i in {1..10}; do
		mpc volume -$step >/dev/null;
		sleep 0.2;
	done
	mpc pause >/dev/null
	# set $vol to 100 if you press shortcut in time interval of fading
	mpc volume "$vol" >/dev/null
else
	mpc volume 0;
	sleep 0.3
	mpc play >/dev/null
	for i in {1..10}; do
		mpc volume +$step >/dev/null;
		sleep 0.2
	done
fi
