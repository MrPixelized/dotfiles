#! /bin/bash

# to use this program, either call setvolume.sh up, setvolume.sh down
# or setvolume.sh toggle

if [[ -z "$2" ]]; then
	volume=5
else
	volume=$2
fi

volume-up() {
	pamixer -i $volume
}

volume-down() {
	pamixer -d $volume
}

volume-toggle() {
	pamixer -t
}

volume-$1

case $(display-server) in
	x11)
		herbstclient emit_hook volume_changed
		;;
esac
