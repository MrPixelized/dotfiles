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

	# Show the list of connected devices
	devices_paired=$(bluetoothctl paired-devices | grep Device | cut -d ' ' -f 2)
	counter=0

	echo -n "$ico_regular"
	echo "$devices_paired" | while read -r line; do
		device_info=$(bluetoothctl info "$line")

		if echo "$device_info" | grep -q "Connected: yes"; then
			device_alias=$(echo "$device_info" | grep "Alias" | cut -d ' ' -f 2-)

			if [ $counter -gt 0 ]; then
				echo -n ", $device_alias"
			else
				echo -n " $device_alias"
			fi

			counter=$((counter + 1))
		fi
	done

	echo
}

bluetoothidle() {
	(echo; bluetoothctl) | while read _; do
		bluetoothinfo
	done
}

bluetoothidle | sed 's/\(.*\)/%{A:rofi-bluetooth:}\1%{A}/'
