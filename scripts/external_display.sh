#!/bin/bash

EXT_DISP="DP1"

function setup_ext() {
    # this command is generated by arandr
    xrandr --output eDP1 --primary --mode 1920x1080 --pos 320x1440 --rotate normal --output DP1 --mode 2560x1440 --pos 0x0 --rotate normal --output HDMI1 --off --output HDMI2 --off --output VIRTUAL1 --off
}

function main() {
    if [[ $(xrandr | grep "^${EXT_DISP} connected") ]]; then
        echo "External display is detected"
        setup_ext
    else
        echo "External display is not connected"
        xrandr --auto
    fi
}

main
