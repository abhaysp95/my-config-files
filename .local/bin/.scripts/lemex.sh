#!/usr/bin/env sh

# define 2020-01-07

Clock(){
	DATETIME=$(date "+%a %b %d, %T")

	echo -n "$DATETIME"
}

# Print the clock

while true; do
	echo "%{c}%{B#181818}%{F#de935f}%{U#f0c674} $(Clock) %{F-}%{B-}"
	sleep 1
done

