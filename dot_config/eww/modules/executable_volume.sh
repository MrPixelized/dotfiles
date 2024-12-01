#!/bin/bash
# Pass FG, ALERT and DEFAULT_POLL_INTERVAL as environment variables

# Prints info about the current volume
volumeinfo() {
	sink=$(pactl get-default-sink)
	volume=$(pactl get-sink-volume $sink |
		head -n 1 |
		cut -d '/' -f 2 |
		xargs |
		sed 's/%$//'
		)
	mute=$(pactl get-sink-mute $sink | sed 's/Mute: //')

	echo "{\"value\": \"$volume\", \"mute\": \"$mute\"}"
}

# IDLEs, listening for volume changes and returning volume state
volumeidle() {
	volumeinfo 

	pactl subscribe |
	while read l; do
		# print info on volume state
		grep "'change' on sink" <<<"$l" > /dev/null && volumeinfo
	done
}

volumeidle
