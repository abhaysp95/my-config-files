#!/usr/bin/env sh

while [ -n "$1" ]
do
	case "$1" in
		-a) echo "-a option used" ;;
		-b) echo "-b option used" ;;
		-c) echo "-c option used" ;;
		*) echo "Option $1 is not an option" ;;
	esac
	shift
done
