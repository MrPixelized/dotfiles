#!/bin/bash

datetime=$(date "+%Y-%m-%d %H-%M-%S")
location="$HOME/pictures/screenshots/$datetime.png"

screenshot-area() {
	case $(display-server) in
		wayland)
			grim -g "$(slurp)" - | tee "$location" | wl-copy
			;;
		x11)
			# Make cursor show up if hidden
			xdotool mousemove_relative --sync 0 1
			xdotool mousemove_relative --sync 0 -1
			maim -s | xclip -selection clipboard -t image/png
			xclip -selection clipboard -o -t image/png > "$location"
			# maim -s | xclip -selection clipboard -t image/png
			;;
	esac
}

screenshot-screen() {
	case $(display-server) in
		wayland)
			grim - | tee "$location" | wl-copy
			;;
		x11)
			maim | tee "$location" | xclip -selection clipboard -t image/png
			;;
	esac
}

case "$1" in
	--area)
		screenshot-area
		;;
	--screen)
		screenshot-screen
		;;
	*)
		screenshot-screen
		;;
esac
