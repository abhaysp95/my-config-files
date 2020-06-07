#!/usr/bin/env bash
#     _    ____  ____
#    / \  / ___||  _ \   Abhay Shanker Pathak
#   / _ \ \___ \| |_) |  abhaysp9955@gmail.com
#  / ___ \ ___) |  __/   https://github.com/coolabhays
# /_/   \_\____/|_|
#
# get script files


declare options="$(basename -a $(fd . ~/.local/bin/.scripts --type f -u))"

option="$(echo -e "${options[@]}" | dmenu -i -p 'script-edit: ' -nb '#282828' -sf '#282828' -nf '#ebdbb2' -sb '#d79921' -fn "Ubuntu Mono Nerd Font Mono 5")"
#echo $option

if [ -z "${option}" ]; then
	exit 1;
else
	file_name="$(fd . ~/.local/bin/.scripts --type f -u | grep ${option})"
	$TERMINAL -e $EDITOR ${file_name}
fi
