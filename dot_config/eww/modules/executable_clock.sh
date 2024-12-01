#!/bin/bash

# Print info about the current time
clockinfo() {
	date "+%d %b %H:%M:%S"
}

# IDLE, printing clock info every second
clockpoll() {
	while : ;do
		clockinfo

		sleep 1
	done
}

clockpoll
