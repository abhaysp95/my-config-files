#!/usr/bin/env sh

# Author: Abhay Shanker Pathak
# Date: 2020-04-03
# Description: dmenu script to select network
# Email: abhaysp9955@gmail.com
# Github: https://github.com/CoolAbhayS
# Last Edited: 2020-04-03

# <<<
option=$(printf "radio\nconnect/disconnect" | dmenu -p network -i -l 10)

if [ "$option" = 'radio' ]; then
	ropt=$(printf "all\nwifi" | dmenu -p radio -i -l 10)
	if [ "$ropt" = "all" ]; then
		aopt=$(printf "on\noff" | dmenu -p -i all -l 10)
		echo "nmcli $option $ropt $aopt"
	else
		aopt=$(printf "on\noff" | dmenu -p -i wifi -l 10)
		echo "nmcli $option $ropt $aopt"
	fi
fi
# >>>
