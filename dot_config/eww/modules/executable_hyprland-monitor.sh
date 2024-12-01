#!/bin/bash

(echo "monitoradded>>"; socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock) | while read line; do
	if [[ $line =~ monitor.*\>\> ]]; then
		hyprctl monitors | grep "^Monitor" | head -n -1 | wc -l
	fi
done

