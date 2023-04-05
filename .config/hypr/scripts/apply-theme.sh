#!/bin/sh

# Clear log file
> .config/hypr/theme.log

# Keep the name of the theme used on the previous session
PREV_THEME="$(cat .config/hypr/current-theme)"

# Write the name of this session's theme
echo $COLOR_SCHEME > .config/hypr/current-theme

# Kill waybar and hyprpaper in case this script is run again after launch
pkill waybar
pkill hyprpaper

# Change Waybar output depending on monitor
sed -i -E 's/("output": ")(.*)(",)/\1'"$MAIN_DISPLAY"'\3/g' .config/waybar/$WAYBAR/config
# Launch Waybar
waybar --config .config/waybar/$WAYBAR/config --style .config/waybar/$WAYBAR/style.css &

# Wallpaper
hyprpaper -c .config/hypr/hyprpaper/$WALLPAPER.conf &

# If the theme has changed since last session
if [ $PREV_THEME != $COLOR_SCHEME ]
then
    # GTK Theme
    gsettings set org.gnome.desktop.interface gtk-theme "$GTK_THEME"
    gsettings set org.gnome.desktop.wm.preferences theme "$GTK_THEME"
    cp -R .config/themes/gtk/$GTK_THEME/. .config/

    # Nvim theme
    sed -i -E '8 s/(theme = ")(.*)(",)/\1'"$NVIM_THEME"'\3/g' .config/nvim/lua/custom/chadrc.lua

    # Kvantum Theme
    kvantummanager --set $KVANTUM_THEME

    # Folder Icons
    # Requires write permissions for the user on /usr/share/icons and /var/lib/papirus-folders
    papirus-folders -C $FOLDERS_THEME -u

    # Zathura theme
    cp .config/themes/zathura/$ZATHURA_THEME/zathurarc .config/zathura/

    # Webcord
    rm .config/WebCord/Themes/*
    cp .config/themes/webcord/$WEBCORD_THEME .config/WebCord/Themes/

    # Betterdiscord
    cp .config/themes/betterdiscord/$BETTERDISCORD_THEME/themes.json .config/BetterDiscord/data/stable/

    # VSCode
    sed -i -E 's/("workbench.colorTheme": ")(.*)(",)/\1'"$VSCODE_THEME"'\3/g' '.config/Code - OSS/User/settings.json'

    # Joplin
    cp .config/themes/joplin/$JOPLIN_THEME/* .config/joplin-desktop/
    sed -i -E 's/("theme": )(.*)(,)/\1'"$JOPLIN_THEME_NUMBER"'\3/g' .config/joplin-desktop/settings.json
    sed -i -E 's/("preferredDarkTheme": )(.*)(,)/\1'"$JOPLIN_THEME_NUMBER"'\3/g' .config/joplin-desktop/settings.json
fi