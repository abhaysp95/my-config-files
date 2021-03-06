#!/usr/bin/env sh

notify-send --icon=~/.cache/notify-icons/yellow-bulb.png -t 5000 "Current brightness level: $(light -G)"
