#! /bin/bash

mic-real-toggle() {
	# pactl set-source-mute alsa_input.pci-0000_00_1f.3.analog-stereo toggle
	pactl list sources |
		sed -En 's/Name:\s(.*)/\1/p' |
		xargs -I {} pactl set-source-mute {} toggle
}

mic-virtual-toggle() {
	pactl set-source-mute AudioRedirect.monitor toggle
}

mic-$1

case $(display-server) in
	x11)
		herbstclient emit_hook microphone_changed
		;;
esac
