#!/usr/bin/env sh

while [ -n "$1" ]
do
	case "$1" in
		-a) echo "-a option found" ;;
		-b) echo "-b option found" ;;
		-c) echo "-c option found" ;;
		--) shift
			break ;;
			# or in below line just do not use "$1" use $1 instead
		*) echo "Option \"$1\" not found" ;;
	esac
	shift
done
# iteration over options is now finished
# iteration over options is starting
num=1
for param in "$@"
do
	# echo "value is $* "
	# $* treats entire set of positional arguments as a single string, while $@ considers every single argument(seperated by space) as individual
	echo "#$num: $param"
	num=$(( num +1 ))	# on second num $num is unnecessary which is used in the book, according to the shellcheck
done
