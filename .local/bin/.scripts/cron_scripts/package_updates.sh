#!/usr/bin/env sh

# this is meant to run in cron
# sync repositories and give package update count

ping -q -c 3 1.1.1.1 > /dev/null || exit

notify-send "📦 Repository sync. Checking for package updates..."


count="$(checkupdates | wc -l)" || notify-send 'Error checking updates

Check you internet connection, if pacman is already running or run update manually'

# count="$(sudo pacman -Qu | grep -cv '\[ignored\]')"

if [ -n "$count" ]; then
	notify-send "🎁 Repository sync." "$count updates available. Run update manually"
else
	notify-send "📦 Repositories Sync" "Sync Complete. No new update"
fi
