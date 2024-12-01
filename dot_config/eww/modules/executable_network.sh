#!/bin/bash

networkinfo() {
	info=$(nmcli device status | sed -n 2p)
	state=$(echo $info | cut -d " " -f3)

	case $state in
		connected)
			state=$(echo $info | cut -d " " -f4-)
			;;
	esac

	echo "󰖩 $state"
}

networkidle() {
	(echo; nmcli device monitor) |
	while read _; do
		networkinfo
	done
}

networkidle
