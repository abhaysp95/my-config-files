#!/usr/bin/env sh

#form="\n<b>Artist:</b>\t<span color='##a1b56c'>%artist%</span>\n<b>Album:</b>\t<span color='##6a9fb5'>%album%</span>\n<b>Title:</b><span color='##ac4142'>%title%</span>"


while true
do
    mpc idle player

    if [ -z "$(mpc current -f %album%)" ] && [ -z "$(mpc current -f %artist%)" ] \
	&& [ -z "$(mpc current -f %title%)" ]
	then
	    toprint="$(mpc | head -n 1)"
    elif [ -z "$(mpc current -f %album%)" ] && [ -z "$(mpc current -f %artist%)" ]
	then
	    form="$(printf "Title: %s" "%title%")"
	    toprint="$(mpc current -f "$form")"
    elif [ -z "$(mpc current -f %album%)" ]
	then
	    form="$(printf "Artist: %s\nTitle: %s" "%artist%" "%title%")"
	    toprint="$(mpc current -f "$form")"
    else
	form="$(printf "Album: %s\nArtist: %s\nTitle: %s" "%album%" "%artist%" "%title%")"
	toprint="$(mpc current -f "$form")"
    fi

    echo "$toprint"

    dunstify -a MPD -t 3000 -r 1337 -i ~/.cache/notify-icons/music-note.png "Current Song" "$toprint"
done
