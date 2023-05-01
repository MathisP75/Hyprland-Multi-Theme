#!/usr/bin/env bash

# Script to create pop-up notification when volume changes.

# Create a delay so the change in volume can be registered:
sleep 0.05

# Get the volume and check if muted or not (STATE):
VOLUME=$(pamixer --get-volume)

STATE=$(pamixer --get-mute)
# Have a different symbol for varying volume levels:
if [[ $STATE != 'true' ]]; then
	if [ "${VOLUME}" == "0" ]; then
		ICON=婢
	elif [ "${VOLUME}" -lt "33" ] && [ "$VOLUME" -gt "0" ]; then
		ICON=奄
	elif [ "${VOLUME}" -lt "90" ] && [ "$VOLUME" -ge "33" ]; then
		ICON=奔
	else
		ICON=墳
	fi

	notify-send -e -u low "${ICON} Volume: $VOLUME%" -h int:value:"${VOLUME}" -r 1

# If volume is muted, display the mute sybol:
else
	notify-send -e -u low "婢 (Volume: $VOLUME%)" -h int:value:"${VOLUME}" -r 1
fi