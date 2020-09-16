#!/usr/bin/env sh

wid=$1
class=$2

if [ "$class" = "scratchpad" ]; then
	xdotool windowmove $wid 10 720
fi
