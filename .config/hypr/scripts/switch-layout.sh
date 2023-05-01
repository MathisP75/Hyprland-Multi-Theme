#!/bin/sh

# Switch to dwindle layout
hyprctl getoption general:layout | grep "master"

if [[ $? == 0 ]]; then
    hyprctl keyword general:layout dwindle
    notify-send -e "Dwindle Layout"
    exit
fi

# Switch to master layout
hyprctl getoption general:layout | grep "dwindle"

if [[ $? == 0 ]]; then
    hyprctl keyword general:layout master
    notify-send -e "Master Layout"
    exit
fi
