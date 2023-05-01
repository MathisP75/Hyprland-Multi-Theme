#!/bin/sh

hyprctl keyword general:cursor_inactive_timeout 1
sleep .1

${hyprpicker}/bin/hyprpicker -r -z & picker_proc=$!

if [ $1 -eq 0 ]
then
    ${grimblast}/bin/grimblast save area "$HOME/Pictures/screenshots/$(date +'%s_grim.png')"
elif [ $1 -eq 1 ]
then
    ${grimblast}/bin/grimblast save area - | wl-copy
fi

kill $picker_proc

hyprctl keyword general:cursor_inactive_timeout 0