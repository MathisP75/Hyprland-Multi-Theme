#!/bin/sh

DND=$(swaync-client -D)

if [[ $DND != 'true' ]]; then
    play ~/Music/dont_ping_me.mp3
fi