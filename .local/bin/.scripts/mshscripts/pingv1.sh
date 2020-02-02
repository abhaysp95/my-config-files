#!/usr/bin/env sh

# Author: Abhay Shanker Pathak
# Date: 2020-02-01
# Description: Script to ping a server
# Last Edited: 2020-02-01

read -p "Which server should be pinged: " server_addr
#ping -c6 "$server_addr" 2>1 > /dev/null || echo "Server Dead"
ping -c6 "$server_addr" || echo "Server Dead"

