#!/bin/bash

# Print info about music
mpdinfo() {
	# Get track name and artist
	track=$(mpc current | xargs -0)

	# Get play/pause status
	status=$(mpc | tail -n 2 | grep -o "\[.*\]")
	[[ "$status" == "[paused]" ]] && status="契"
	[[ "$status" == "[playing]" 	]] && status=""
	[[ -z "$status" 			]] && status="栗"

	# Truncate track length
	length=30
	if [ $(expr length "$track") > $length ]; then
		track=${track:0:$length}
		[[ $(expr length "$track") == $length ]] &&
			track=$(echo $track | xargs -0)...
	fi

	# Print player state
	echo -e "%{A:mpc toggle:}$status $track%{A}"
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
