#!/usr/bin/env bash
#     _    ____  ____
#    / \  / ___||  _ \   Abhay Shanker Pathak
#   / _ \ \___ \| |_) |  abhaysp9955@gmail.com
#  / ___ \ ___) |  __/   https://github.com/coolabhays
# /_/   \_\____/|_|
#
# disk usage module for polybar

root_per=$(df -h | awk '/sda1/ {print $5}')
home_per=$(df -h | awk '/sda2/ {print $5}')

printf "%s | %s" "$root_per" "$home_per"
