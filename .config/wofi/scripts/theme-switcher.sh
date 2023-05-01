#!/bin/bash

entries="Mocha\nNord\nSolarized\nGruvbox\nTokyo-Night\nDracula\nEverforest"
source='source = ~/.config/hypr/themes/'
hyprland-conf=~/.config/hypr/hyprland.conf
# delete-line="$(sed -i '1d' ~/.config/hypr/hyprland.conf)"

selected=$(echo -e $entries|wofi --dmenu $2 --style ~/.config/wofi/themes/$1.css --hide-scroll --cache-file /dev/null)

case $selected in
  Mocha)
    notify-send "Mocha"
    sed -i '1d' ~/.config/hypr/hyprland.conf
    sed -i '1i\source = ~/.config/hypr/themes/mocha/mocha.conf' ~/.config/hypr/hyprland.conf
    ;;
  Nord)
    notify-send "Nord"
    sed -i '1d' ~/.config/hypr/hyprland.conf
    sed -i '1i\source = ~/.config/hypr/themes/nord/nord.conf' ~/.config/hypr/hyprland.conf
    ;;
  Solarized)
    notify-send "Solarized"
    sed -i '1d' ~/.config/hypr/hyprland.conf
    sed -i '1i\source = ~/.config/hypr/themes/solarized/solarized.conf' ~/.config/hypr/hyprland.conf
    ;;
  Gruvbox)
    notify-send "Gruvbox"
    sed -i '1d' ~/.config/hypr/hyprland.conf
    sed -i '1i\source = ~/.config/hypr/themes/gruvbox/gruvbox.conf' ~/.config/hypr/hyprland.conf
    ;;
  Everforest)
    notify-send "Everforest"
    sed -i '1d' ~/.config/hypr/hyprland.conf
    sed -i '1i\source = ~/.config/hypr/themes/everforest/everforest.conf' ~/.config/hypr/hyprland.conf
    ;;
esac