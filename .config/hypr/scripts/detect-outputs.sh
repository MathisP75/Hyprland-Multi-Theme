#!/bin/sh

USBC=$(cat /sys/class/drm/card0-DP-1/status) # Display in USB C port
DP=$(cat /sys/class/drm/card0-DP-2/status) # Display in Display Port

if [ "$USBC" = 'disconnected' ] && [ "$DP" = 'disconnected' ]; then
	export MAIN_DISPLAY=eDP-1
	export XCURSOR_SIZE=24
else
	export MAIN_DISPLAY=DP-2
	export XCURSOR_SIZE=48
fi