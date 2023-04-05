#!/bin/bash

entries="⭮ Reboot\n⏻ Shutdown\n⇠ Logout\n⏾ Suspend"

selected=$(echo -e $entries|wofi --xoffset 0 --width=10% --height=100% --dmenu --style ~/.config/wofi/themes/"$COLOR_SCHEME".css --hide_search=true --hide-scroll --cache-file /dev/null | awk '{print tolower($2)}')

case $selected in
  logout)
    exec hyprctl dispatch exit NOW;;
  suspend)
    exec systemctl suspend;;
  reboot)
    exec systemctl reboot;;
  shutdown)
    exec systemctl poweroff -i;;
esac