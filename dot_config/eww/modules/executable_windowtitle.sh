#!/bin/bash

handle() {
	case $1 in
		activewindow\>\>*) truncate $(echo $1 | cut -d "," -f 2);;
	esac
}

truncate() {
	length=50
	text=$@

	if [ $(expr length "$text") > $length ]; then
		text=${text:0:$length}
		[[ $(expr length "$text") == $length ]] &&
			text=$(echo $text | xargs -0)...
	fi

	echo "$text"
}

socat -U - UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock | while read -r line; do handle "$line"; done
