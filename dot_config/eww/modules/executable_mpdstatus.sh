#!/bin/bash

# Print info about music
mpdinfo() {
	# Get volume
	volume=$(mpc volume)
	volume=${volume##* }
	[[ $volume == "n/a%" ]] && volume = ""

	# Get play/pause status
	status=$(mpc | tail -n 2 | grep -o "\[.*\]")
	[[ "$status" == "[paused]" ]] && status="󰏤"
	[[ "$status" == "[playing]" ]] && status="󰐊"
	[[ -z "$status" 			]] && status="󰐊"

	# Print player state
	echo -e "%{A:mpc toggle:}$status%{A}"
}

# IDLE, printing info about mpd state as it comes in
mpdidle() {
	(echo; mpc idleloop) |
	while read _; do
		# Print info on mpd state
		mpdinfo
	done
}

mpdidle
