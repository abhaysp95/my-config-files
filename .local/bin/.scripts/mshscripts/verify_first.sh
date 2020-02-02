#!/usr/bin/env sh

# Author: Abhay Shanker Pathak
# Date: 2020-02-02
# Description: Script to echo after verification
# Last Edited: 2020-02-02

echo "You are using $(basename "$0") shell"
test -z "$1" || echo "Hello $1"
echo "$0"
exit 0
