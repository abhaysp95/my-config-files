#!/usr/bin/env sh

logfile=${XDG_CACHE_HOME:-$HOME/.cache}/net/log
prevdata="$(cat "${logfile}")"
#echo "${prevdata}"

rxcurrent="$(($(cat /sys/class/net/*/statistics/rx_bytes | paste -sd '+')))"
txcurrent="$(($(cat /sys/class/net/*/statistics/tx_bytes | paste -sd '+')))"

#echo "${rxcurrent} ${txcurrent}"

rx_in_kib="$(((rxcurrent - ${prevdata%% *}) / 1024))"
tx_in_kib="$(((txcurrent - ${prevdata##* }) / 1024))"


sys_ether_name=$(nmcli device | awk '/ethernet/ && $3 == "connected" {print $1}')
sys_wifi_name=$(nmcli device | awk '/wifi/ && $3 == "connected" {print $1}')

if [ -n "${sys_wifi_name}" ] && [ -z "${sys_ether_name}" ]; then
	wifi_name=$(nmcli device show ${sys_wifi_name} \
		| awk 'BEGIN {IGNORECASE = 1} /general.connection/ {print $2}')
	connected=" "
	if [ ${rx_in_kib} -gt 1024 ]; then
		printf " %s %s %.1fmib %s %.1fmib" "${connected}" "" "$((rx_in_kib / 1024)).$((rx_in_kib % 1024))" \
			"" "$((tx_in_kib / 1024)).$((rx_in_kib % 1024))"
	elif [ ${tx_in_kib} -gt 1024 ]; then
		printf " %s %s %.1fmib %s %.1fmib " "${connected}" "" " $((rx_in_kib / 1024)).$((rx_in_kib % 1024))" \
			"" "$((tx_in_kib / 1024)).$((rx_in_kib % 1024))"
	else
		printf " %s %skib %skib " "${connected}" " ${rx_in_kib}" " ${tx_in_kib}"
	fi
elif [ -n "${sys_ether_name}" ]  && [ -z "${sys_wifi_name}" ]; then
	ether_name=$(nmcli device show ${sys_ether_name} \
		| awk 'BEGIN {IGNORECASE = 1} /general.connection/ {print $2}')
	connected=" "
	if [ ${rx_in_kib} -gt 1024 ]; then
		printf " %s %s %.1fmib %s %.1fmib" "${connected}" "" "$((rx_in_kib / 1024)).$((rx_in_kib % 1024))" \
			"" "$((tx_in_kib / 1024)).$((rx_in_kib % 1024))"
	elif [ ${tx_in_kib} -gt 1024 ]; then
		printf " %s %s %.1fmib %s %.1fmib " "${connected}" "" " $((rx_in_kib / 1024)).$((rx_in_kib % 1024))" \
			"" "$((tx_in_kib / 1024)).$((rx_in_kib % 1024))"
	else
		printf " %s %skib %skib " "${connected}" " ${rx_in_kib}" " ${tx_in_kib}"
	fi
elif [ -n "${sys_wifi_name}" ] && [ -n "${sys_ether_name}" ]; then
	wifi_name=$(nmcli device show ${sys_wifi_name} \
		| awk 'BEGIN {IGNORECASE = 1} /general.connection/ {print $2}')
	ether_name=$(nmcli device show ${sys_ether_name} \
		| awk 'BEGIN {IGNORECASE = 1} /general.connection/ {print $2}')
	connected="   "
	if [ ${rx_in_kib} -gt 1024 ]; then
		printf " %s %s %.1fmib %s %.1fmib" "${connected}" "" "$((rx_in_kib / 1024)).$((rx_in_kib % 1024))" \
			"" "$((tx_in_kib / 1024)).$((rx_in_kib % 1024))"
	elif [ ${tx_in_kib} -gt 1024 ]; then
		printf " %s %s %.1fmib %s %.1fmib " "${connected}" "" " $((rx_in_kib / 1024)).$((rx_in_kib % 1024))" \
			"" "$((tx_in_kib / 1024)).$((rx_in_kib % 1024))"
	else
		printf " %s %skib %skib " "${connected}" " ${rx_in_kib}" " ${tx_in_kib}"
	fi
else
	printf " %s\n" " "
fi

echo "${rxcurrent} ${txcurrent}" > "$logfile"
