#!/bin/bash

eww daemon --no-daemonize &
eww open hud --screen $(hyprctl monitors -j | jq '.[] | select(.focused == true) .id')
wait 
