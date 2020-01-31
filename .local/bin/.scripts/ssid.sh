#!/bin/bash

#To show ssid name by connected wifi

nmcli -t -f active,ssid dev wifi | egrep 'yes' | cut -d\' -f2
