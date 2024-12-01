#!/bin/bash

# Prints info about the current volume
micinfo() {
	volume=$(pactl get-source-volume $(pactl get-default-source) |
		head -n 1 |
		cut -d '/' -f 2 |
		xargs |
		sed 's/%$//')
	mute=$(pactl get-source-mute $(pactl get-default-source))

	echo "{\"value\": \"$volume\", \"mute\": \"${mute#Mute: }\"}"
}

# IDLEs, listening for microphone changes and returning microphone state
micidle() {
	micinfo

	pactl subscribe |
	while read l; do
		# Print info on microphone state
		grep "'change' on source" <<<"$l" > /dev/null && micinfo
	done
}

michlwmidle() {
	herbstclient -i 'microphone_changed' |
	while read l; do
		# print info on microphone state
		micinfo
	done
}

# Returns the microphone state every n seconds, in case it is
# not changed by hlwm but elsewhere
micpoll() {
	while : ;do
		# Print info on microphone state
		micinfo
		
		sleep 1
	done
}

micidle &
# michlwmidle &
# micpoll & # Interferes with idle
wait
