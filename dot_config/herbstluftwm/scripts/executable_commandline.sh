#!/usr/bin/env zsh
eval_comm() {
	source ~/.config/zsh/.zshrc

	case $(echo $@ | cut -d ' ' -f1) in
		sl|savel*)
			command_stripped=$(echo $@ | cut -d ' ' -f 2-)
			comm="$command_stripped"
			eval "~/.config/herbstluftwm/scripts/savelayout.sh \"$comm\"" 2>&1 | xargs notify-send
			;;
		ll|loadl*)
			command_stripped=$(echo $@ | cut -d ' ' -f 2-)
			comm=$(autocomplete_loadl $command_stripped)
			eval "~/.config/herbstluftwm/scripts/loadlayout.sh $comm"
			;;
		open|o)
			command_stripped=$(echo $@ | sed 's/^o.* //')
			comm=$(autocomplete_open $command_stripped)
			eval "$comm" &
			;;
		mus|music|m)
			command_stripped=$(echo $@ | sed -e 's/^\(m\|m.* \)//')
			comm=$(autocomplete_mpc $command_stripped)
			eval "mpc $comm"
			;;
		\;*)
			notify-send "$(whoami)" "$(echo $@ | sed 's/^;//')" \
				-i ~/pictures/pixelized-icon.png
			;;
		bac*)
			command_stripped=$(echo $@ | sed -e 's/^\(bac\|bac.* \)//')
			comm=$(autocomplete_background $command_stripped)
			eval "~/.config/herbstluftwm/scripts/setbackground.sh $comm"
			;;
		qr)
			eval "~/.config/herbstluftwm/scripts/qr-read.sh"
			;;
		\!*)
			comm=$(echo $@ | sed 's/^!//')
			out="$(bash -c "$comm" 2>&1 | sed "s,\x1B\[[0-9;]*[a-zA-Z],,g")"
			[[ -z $out ]] || notify-send "$comm" "$out"
			;;
		*)
			comm=$(autocomplete_hc $@)
			out="$(eval "hc $comm")"
			# [[ -z $out ]] || notify-send "$comm" "$out"
			;;
	esac
}

# Autocomplete a loaded layout
autocomplete_loadl() {
	pushd ~/.config/herbstluftwm/layouts
	[[ -z "$@" ]] || fd "$@" | head -n 1
	popd
}

# Autocomplete the background command
autocomplete_background() {
	[[ -z "$@" ]] || fd -p "$@" ~/pictures/wallpapers | head -n 1
}

# Autocomplete open commands (starting with :o or :open)
autocomplete_open() {
	ls /usr/bin | grep "$@" | head -n 1
}

# Autocomplete music commands (starting with :m or :music)
autocomplete_mpc() {
	case $@ in
		"")
			echo toggle
			;;
		n)
			echo next
			;;
		p)
			echo prev
			;;
		*)
			echo $@
			;;
	esac
}

# Autocomplete herbstclient commands (any commands)
autocomplete_hc() {
	comm=""
	i=0
	for arg in "$@"
	do
		case "$i $arg" in
			"0 sp"|"0 s")
				completion="split"
				;;
			"0 st"|"0 stack"|"0 vert"|"0 v")
				completion="set_layout vertical"
				;;
			"0 hor"|"0 h")
				completion="set_layout horizontal"
				;;
			"0 grid"|"0 gr"|"0 g")
				completion="set_layout grid"
				;;
			"0 min"|"0 mi")
				completion="set_attr clients.focus.minimized toggle"
				;;
			"0 ju")
				completion="jumpto last-minimized"
				;;
			*)
				completion=$(hc complete $i $comm $arg)
				;;
		esac
		comm="$comm $completion"
		comm=$(echo $comm | sed 's/^ //')
		((i++))
	done

	echo $comm
}

eval_comm $(rofi -theme commandline -dmenu -i -p ":")
