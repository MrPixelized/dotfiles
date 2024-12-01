#!/bin/bash

(echo "workspace>>"; socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock) | while read line; do
	if [[ $line =~ .*workspace.*\>\> ]]; then
		hyprctl workspaces -j | jq -c "[.[] | . += {\"active\": false} | select(.id==$(hyprctl activeworkspace -j | jq ".id")) += {\"active\": true}] | sort_by(.id)"
	fi
done

