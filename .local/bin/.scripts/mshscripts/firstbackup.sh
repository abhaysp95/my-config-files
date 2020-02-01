#!/usr/bin/env sh

# Author: abhay
# Script to prompt to backup files and location
# The files will be search on from the user's home directory within $HOME
# Last edited: Jan 29, 2020
read -p "Which file types do you want to backup? " file_suffix
read -p "Which directory do you want to backup to? " dir_name
# the next line creaes the directory if it doesn't exists
test -d "$HOME"/dir_name || mkdir -m 700 "$HOME"/dir_name
# the find command will copy files and match the search criteria i.e., .sh .
# The -path, -prune and -o options are to exclude the back directory from the backup.
find "$HOME" -path "$HOME/$dir_name" -prune -o \
	-name "*$file_suffix" -exec cp {} "$HOME/$dir_name/" \;
exit 0
