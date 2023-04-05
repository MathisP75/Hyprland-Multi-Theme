#!/bin/bash

entries="⭮ Reboot\n⏻ Shutdown\n⇠ Logout\n⏾ Suspend"

selected=$(echo -e $entries|wofi --width 250 --height 260 --dmenu --style ~/.config/wofi/themes/"$COLOR_SCHEME".css --hide_search=true --hide-scroll --normal-window --cache-file /dev/null | awk '{print tolower($2)}')

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