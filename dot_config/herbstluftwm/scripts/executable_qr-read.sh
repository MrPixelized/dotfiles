#!/bin/bash

datetime=$(date "+%Y-%m-%d %H-%M-%S")
location="/tmp/qr $datetime.png"

# Make the mouse show up if hidden
xdotool mousemove_relative --sync 0 1
xdotool mousemove_relative --sync 0 -1

# Take the screenshot and pipe it into a QR reader via a temporary file
maim -s > "$location" || {
	notify-send "Screenshot error" "There was an error taking the screenshot"
	exit
}

res=$(zxing "$location")

if [ "$res" == "decoding failed" ]; then
	notify-send "QR error" "$res"
else
	echo "$res" | sed -rz 's/\n+$//' | xclip -selection clipboard
	notify-send "QR code yanked to clipboard" "$res"
fi

# Remove the QR in case it was sensitive
rm "$location"
