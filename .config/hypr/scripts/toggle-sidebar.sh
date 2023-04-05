#!/bin/sh

SIDEBAR=$HOME/.sidebar

if [ ! -e $SIDEBAR ]; then
	touch $SIDEBAR
    pkill dunst #&& echo "killed dunst" >> test-logs.log
    swaync --config .config/swaync/side-bar/config.json --style .config/swaync/side-bar/style.css &

    pkill waybar && waybar --config .config/waybar/witcher-bar-laptop-side/config --style .config/waybar/witcher-bar-laptop-side/style.css
    hyprctl --batch keyword "general:col.active_border rgba(000000ff);"
  	hyprctl --batch keyword "general:col.inactive_border rgba(000000ff);"
    hyprctl keyword animation workspaces, 1, 6, overshot, slide
    hyprctl keyword decoration:drop_shadow no 
    hyprctl --batch keyword "general:border_size 2;"
    hyprpaper -c .config/hypr/hyprpaper/hyprpaper-witcher.conf
else
	rm $SIDEBAR
    pkill swaync #&& echo "killed swaync" >> test-logs.log
    dunst &

    pkill waybar && waybar --config .config/waybar/witcher-bar-laptop/config --style .config/waybar/witcher-bar-laptop/style.css
    hyprctl --batch keyword "general:col.active_border rgba(45475aff);"
   	hyprctl --batch keyword "general:col.inactive_border rgba(11111bff);"
    hyprctl keyword animation workspaces, 1, 6, overshot, slidevert
    hyprctl keyword decoration:drop_shadow yes
    hyprctl keyword decoration:shadow_range 17
    hyprctl keyword decoration:shadow_render_power 3
    hyprctl --batch keyword "decoration:col.shadow rgba(00000099);"
    hyprctl --batch keyword "decoration:col.shadow_inactive rgba(00000099);"
    hyprctl --batch keyword "general:border_size 3;"
    hyprpaper -c .config/hypr/hyprpaper/hyprpaper-witcher-2.conf
fi
