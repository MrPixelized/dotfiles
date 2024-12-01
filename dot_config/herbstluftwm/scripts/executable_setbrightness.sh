#! /bin/bash

# to use this program, either call setbrightness.sh up or setbrightness.sh down

if [[ -z "$2" ]]; then
	change=5
else
	change=$2
fi

brightness-up() {
	brightnessctl -e s $change%+
}

brightness-down() {
	[[ $(brightnessctl g) -gt 70 ]] && brightnessctl -e s $change%-
}

brightness-$1

case $(display-server) in
	x11)
		herbstclient emit_hook brightness_changed
		;;
esac
