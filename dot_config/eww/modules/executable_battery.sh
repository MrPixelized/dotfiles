#!/bin/bash

ico_charging="󰂄"
ico_alert="󰂃"
ico_0="󰂎"
ico_10="󰁺"
ico_20="󰁻"
ico_30="󰁼"
ico_40="󰁽"
ico_50="󰁾"
ico_60="󰁿"
ico_70="󰂀"
ico_80="󰂁"
ico_90="󰂂"
ico_100="󰁹"

# Get a battery icon belonging to a charge percentage
pct-to-icon() {
	ico="$ico_alert"
	[[ $1 -ge 5  ]] && ico="$ico_0"
	[[ $1 -ge 10 ]] && ico="$ico_10"
	[[ $1 -ge 20 ]] && ico="$ico_20"
	[[ $1 -ge 30 ]] && ico="$ico_30"
	[[ $1 -ge 40 ]] && ico="$ico_40"
	[[ $1 -ge 50 ]] && ico="$ico_50"
	[[ $1 -ge 60 ]] && ico="$ico_60"
	[[ $1 -ge 70 ]] && ico="$ico_70"
	[[ $1 -ge 80 ]] && ico="$ico_80"
	[[ $1 -ge 90 ]] && ico="$ico_90"
	[[ $1 -ge 100 ]] && ico="$ico_100"

	echo "$ico"
}

# Prints info on battery
batteryinfo() {
	capacity=$(cat /sys/class/power_supply/BAT1/capacity)
	state=$(cat /sys/class/power_supply/BAT1/status)

	case $state in
		Discharging)
			state="$(pct-to-icon $capacity)"
			;;

		Charging)
			state="$ico_charging"
			;;

		Full)
			state="$ico_100"
			;;
		
		*)
			state="$(pct-to-icon $capacity)"
			;;
	esac

	echo "{\"value\": \"$capacity\", \"icon\": \"$state\"}"
}

# Sets up inotify listeners for system files related to battery info,
# and prints battery state when they change
batteryidle() {
	(echo; upower -m) | while read line; do
		# Print battery info only if new info has come in
		[[ "$wlast" == "${line%% *}" ]] || batteryinfo
		wlast=${line%% *}
	done
}

batteryidle
