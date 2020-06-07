#!/usr/bin/env bash
#     _    ____  ____
#    / \  / ___||  _ \   Abhay Shanker Pathak
#   / _ \ \___ \| |_) |  abhaysp9955@gmail.com
#  / ___ \ ___) |  __/   https://github.com/coolabhays
# /_/   \_\____/|_|
#
# get upload and download speed of net


# get connection name(put you ethernet and wifi name here)

logdir="$HOME"/.cache/net

if [ ! -d "${logdir}" ]; then
	mkdir "${logdir}"
	touch "${logdir}"/log
fi

logfile=${XDG_CACHE_HOME:-$HOME/.cache}/net/log
prevdata="$(cat "${logfile}")"

#sys_ether_name=$(nmcli device | awk '/ethernet/ && $3 == "connected" {print $1}')
#sys_wifi_name=$(nmcli device | awk '/wifi/ && $3 == "connected" {print $1}')
sys_ether_name=$(nmcli device | grep -E '\<ethernet\>.*\<connected\>' | cut -d ' ' -f1)
sys_wifi_name=$(nmcli device | grep -E '\<wifi\>.*\<connected\>' | cut -d ' ' -f1)

#echo ${sys_wifi_name}
echo ${sys_ether_name}


wname=$(nmcli device show ${sys_wifi_name} | grep -i 'general.connection')
ename=$(nmcli device show ${sys_wifi_name} | grep -i 'general.connection')

#if [ "$PS1" != "" ]; then
if [ -t 0 ] && [ -t 1 ]; then
	if [ -n "${sys_wifi_name}" ] && [ -z "${sys_ether_name}" ]; then
		#wifi_name=$(nmcli device show ${sys_wifi_name} \
			#| awk 'BEGIN {IGNORECASE = 1} /general.connection/ {$1=""; print $0}')
			#| awk 'BEGIN {IGNORECASE = 1} /general.connection/ { for (i=2; i<=NF; i++) printf "%s", $i }')
		wifi_name=$(echo ${wname##* })
		printf "%s\n" "${wifi_name}"
		printf "%s\n" "Ethernet Not Connected"
	elif [ -n "${sys_ether_name}" ]  && [ -z "${sys_wifi_name}" ]; then
		ether_name=$(echo ${ename##* })
		printf "%s\n" "${ether_name}"
		printf "%\ns" "Wifi Not Connected"
	elif [ -n "${sys_wifi_name}" ] && [ -n "${sys_ether_name}" ]; then
		wifi_name=$(echo ${wname##* })
		ether_name=$(echo ${ename##* })
		printf "%s\n" "${wifi_name}"
		printf "%s\n" "${ether_name}"
	else
		printf "%s\n" "Ethernet Not Connected"
		printf "%s\n" "Wifi Not Connected"
	fi
	rxcurrent="$(($(cat /sys/class/net/*/statistics/rx_bytes | paste -sd '+')))"
	txcurrent="$(($(cat /sys/class/net/*/statistics/tx_bytes | paste -sd '+')))"

	rx_in_kib="$(((rxcurrent - ${prevdata%% *}) / 1024))"
	tx_in_kib="$(((txcurrent - ${prevdata##* }) / 1024))"

	if [ ${rx_in_kib} -gt 1024 ]; then
		printf "%smib %smib\n" "$((rx_in_kib / 1024)).$((rx_in_kib % 1024))" \
			"$((tx_in_kib / 1024)).$((rx_in_kib % 1024))" \
			| figlet -f /usr/share/figlet/fonts/ANSI\ Shadow
	elif [ ${tx_in_kib} -gt 1024 ]; then
		printf "%smib %smib\n" "$((rx_in_kib / 1024)).$((rx_in_kib % 1024))" \
		"$((tx_in_kib / 1024)).$((rx_in_kib % 1024))" \
			| figlet -f /usr/share/figlet/fonts/ANSI\ Shadow
	else
		printf "%skib %skib" "${rx_in_kib}" "${tx_in_kib}" \
			| figlet -f /usr/share/figlet/fonts/ANSI\ Shadow
	fi
	echo "${rxcurrent} ${txcurrent}" > "$logfile"
else
	if [ -n "${sys_wifi_name}" ] && [ -z "${sys_ether_name}" ]; then
			# print all columns accept 1
		wifi_name=${wname##* }
		notify-send --icon=~/.cache/notify-icons/radio-antenna.png -t 5000 "${wifi_name}
Ethernet Not Connected"
	elif [ -n "${sys_ether_name}" ]  && [ -z "${sys_wifi_name}" ]; then
		ether_name=$(echo ${ename##* })
		notify-send --icon=~/.cache/notify-icons/radio-antenna.png -t 5000 "${ether_name}
Wifi Not Connected"
	elif [ -n "${sys_wifi_name}" ] && [ -n "${sys_ether_name}" ]; then
		wifi_name=$(echo ${wname##* })
		ether_name=$(echo ${ename##* })
		notify-send --icon=~/.cache/notify-icons/radio-antenna.png -t 5000 "${wifi_name}
${ether_name}"
	else
		notify-send --icon=~/.cache/notify-icons/radio-antenna.png -t 5000 "Ethernet Not Connected
Wifi Not Connected"
	fi
fi
