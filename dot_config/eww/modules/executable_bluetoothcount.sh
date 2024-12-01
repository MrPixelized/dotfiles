#!/bin/bash
# Pass ALERT and FG environment variables to set colors

ico_unavailable="󰂲"
ico_regular="󰂯"

bluetoothinfo() {
	# Display alerted 'bluetooth not available' when the controller is
	# unavailable
	if bluetoothctl show | grep -q 'Powered: no'; then
		echo "%{F$ALERT}$ico_unavailable%{F$FG}"
		return
	fi

	# Show the number of connected devices
	count=$(bluetoothctl info | grep ^Device | wc -l)
	( [[ $count == "0" ]] &&
		echo "$ico_regular" ||
		echo "$ico_regular $count" ) | 
			sed 's/\(.*\)/%{A:rofi-bluetooth:}\1%{A}/'
}

bluetoothinfo

bluetoothctl | while read _; do
	bluetoothinfo
done
