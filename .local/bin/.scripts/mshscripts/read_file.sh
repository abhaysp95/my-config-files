#!/usr/bin/env sh

# Author: Abhay Shanker Pathak
# Date: 2020-02-01
# Description: Reading a file
# Last Edited: 2020-02-01

read -p "Which file do you want to read(enter address): " file_addr
while read line
do
	echo "$line"
done < "$HOME/$file_addr"

