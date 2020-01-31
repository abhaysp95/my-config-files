#!/usr/bin/env sh

read -p "May I ask your last name: " name
echo "Ohh, it's $name"
# read -s controls visibility whereas -n1 means only 1 character
read -sn1 -p "Press any key to exit "
echo
exit 0
