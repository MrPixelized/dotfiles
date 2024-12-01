#!/bin/bash

eww daemon --no-daemonize &

id=$(hyprctl monitors -j | jq '.[] | select(.focused == true) .id')
max=$(hyprctl monitors -j | jq '[.[].id] | max')
min=$(hyprctl monitors -j | jq '[.[].id] | min')
total=$(hyprctl monitors -j | jq '[.[].id] | length')

echo $id
echo $sub

if [[ "$id" == "0" && "$min" == "0" ]]; then
	eww open bar --screen 0 --size 1440x22
else
	id=$(($id - $max - 1 + $total))
	echo $id
	eww open bar --screen $id
fi

wait 
