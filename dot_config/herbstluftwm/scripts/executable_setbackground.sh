#! /bin/bash

wallpath="$HOME/.local/share/wallpaper"

if [ "$1" = "--restore" ]; then
	path=$wallpath
elif [ -z "$@" ]; then
	path="$HOME/pictures/wallpapers"
else
	path="$@"
fi

choice=$(find $path -type f,l | shuf -n 1)

[ "$choice" != "$wallpath" ] &&
	ln -fs $choice $wallpath

echo $choice

case $(display-server) in 
	wayland)
		swww img "$choice" --transition-type none --transition-duration 3 --transition-fps 30 --transition-pos center --transition-step 255 --transition-bezier 0.05,0.1,0.15,0.2
		;;
	x11)
		for i in $(xrandr | grep " connected " | wc -l | xargs expr -1 + | xargs seq 0); do
			nitrogen --set-zoom-fill --head=$i $choice
		done
		;;
esac
