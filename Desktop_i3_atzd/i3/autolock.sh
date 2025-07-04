#!/bin/bash

playerctlstatus=$(playerctl status 2> /dev/null)
playerctlstatusrandom=$(playerctl -p somethingsomething status 2> /dev/null)

if [ "$playerctlstatus" = "$playerctlstatusrandom" ]; then
    dunstctl set-paused true && setxkbmap us && xset dpms force suspend && i3lock -i ~/.local/share/wallpapers/wallpaper_arch_blur_1920x1080.png -u -n; dunstctl set-paused false && setxkbmap -layout "us,rs,rs" -variant ",latinyz,"
fi
