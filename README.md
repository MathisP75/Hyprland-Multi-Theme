# Hyprland-Multi-Theme
A Hyprland config containing multiple themes and an easy way to switch between them and create new ones.

## Structure and functioning:

The theme that is being used is defined in the main `hyprland.conf` file by sourcing a theme-specific Hyprland config file, for example `source = ~/.config/hypr/themes/nord/nord.conf`. The theme-specific Hyprland configs are in folders inside `.config/hypr/themes` along with a JSON file. The global Hyprland config is in `.config/hypr`.

Then, that theme-specific Hyprland config defines everything related to that theme for Hyprland. This includes statup apps, Hyprland plugins, decorations, animations, window and layer rules, binds and more. Most importantly, that file contains a startup script that will apply the theme to the rest of the system. That script is `switch-theme.sh` and it is located inside `.config/hypr/scripts`. It takes the theme name as an argument and then parses the corresponding JSON file to apply the themes to the different apps.

**The themes for different programs are set in different ways, which might make this very confusing, but I will try my best to explain how it all works.**

* Some themes are set directly in the theme-specific Hyprland config, such as startup apps like a notification daemon or apps that are launched through keybinds, like Wofi.
* Other themes can be changed by copying files in the right place. For example, Webcord uses any theme found inside `.config/WebCord/Themes`. All of the themes for these apps are stored in `.config/themes/<app-name>`.
* In a lot of cases, it is necessary to directly edit a file using a `sed` command to change the them of an app.
* In the case of Dark Reader, the theme has to be changed by doing an SQL request, but this is an exception.

**To clarify things, here is an example:**

1. `hyprland.conf` is loaded and the theme is set to nord by sourcing `.config/hypr/themes/nord/nord.conf`.
2. `nord.conf` sets everything Hyprland can control to the nord theme (borders, wofi menus, startup programs that can take a specifig config file as an argument, etc.)
3. `nord.conf` then executes `switch-theme.sh` with the `nord` argument after. This script will go parse everything in the corresponding JSON file (`.config/hypr/themes/nord/nord.json`) and change the themes of all the apps/progams it can.

## Structure of the JSON config:

```
{
    "gtkTheme": "Nordic-transparent",
    "kvantumTheme": "Nordic-Solid",
    "iconTheme": "Nordic",
    "colorScheme": "nord",
    "vsCodeTheme": "Nord",
    "vsCodeExtraColors" : "\"window.background\":\"#2e3440e5\",\"editor.background\":\"#2e344000\",\"editorGutter.background\":\"#2e344000\"",
    "nvimTheme": "nord",
    "obsidianTheme": "Obsidian Nord",
    "font": "JetBrainsMono Nerd Font",
    "darkReaderColors": {"background": "#2e3440", "text": "#eceff4"}
}
```

* "gtkTheme" defines the GTK theme
* "kvantumTheme" defines the Kvantum (QT) theme
* "iconTheme" defines the icon theme for both GTK and QT apps
* "colorScheme" defines the kitty color scheme and the config/style directory to use for Waybar, Hyprpaper, Webcord, BetterDiscord, Firefox and Zathura.
* "vsCodeTheme" defines the VS Code theme
* "vsCodeExtraColors" defines color overrides for the transparent VS Code fork `code-transluscent` and can be left empty
* "nvimTheme" defines the NvChad color scheme (some changes have to be made to the configs for it to work correclty)
* "obsidianTheme" defines the Obsidian theme
* "font" defines the system font for GTK apps, QT apps and VS Code
* "darkReaderColors" defines the colors Dark Reader will use to recolor web pages

## Theme switching:

Switching is handled by a Wofi menu that changes the sourced theme-specific Hyprland config with a `sed` command. It can be found in `.config/wofi/scripts/theme-switcher.sh`.

## Supported apps, programs and settings:

* Hyprland
* Waybar
* Wofi
* Kvatum/QT
* Fonts
* Icon theme
* Wallpaper
* Kitty
* VS Code
* Nvim (NvChad)
* Obsidian
* Webcord
* Discord (through BetterDiscord)
* Firefox
* Zathura
* Dark Reader
* SwayLock# Hyprland-Multi-Theme
A Hyprland config containing multiple themes and an easy way to switch between them and create new ones
