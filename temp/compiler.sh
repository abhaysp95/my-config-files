#!/usr/bin/env sh

# Author: Abhay Shanker Pathak
# Date: 2020-02-24
# Description: testing for compiler
# Email: abhaysp9955@gmail.com
# Github: https://github.com/CoolAbhayS
# Last Edited: 2020-02-24

gcc "$1" -o "$1" | sed/.sh//g
