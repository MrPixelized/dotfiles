#!/bin/bash
# Pass DEFAULT_POLL_INTERVAL as environment variable to set the polling interval

brightness_script=/home/ischa/.config/herbstluftwm/scripts/setbrightness.sh

# Prints info about the current brightness
brightnessinfo() {
	brightnessctl i -m | cut -d ',' -f4 | sed 's/.$//'
}

# IDLEs, listening for brightness changes and returning brightness state
brightnessidle() {
	(echo; herbstclient -i 'brightness_changed') |
	while read _; do
		# Print info on brightness state
		brightnessinfo
	done
}

# Returns the brightness state every n seconds, in case it is
# not changed by hlwm but elsewhere
brightnesspoll() {
	while : ;do
		brightnessinfo
		sleep 2
	done
}

brightnesspoll &

wait
