#! /usr/bin/bash

export DISPLAY=:0
export XAUTHORITY=/opt/player/.Xauthority

function connect(){
    xrandr --output VIDEOINTERFACE --mode RESOLUTION && /usr/bin/supervisorctl restart APPNAME
}

function disconnect(){
      xrandr --output VIDEOINTERFACE --off
}

xrandr | grep "HDMI2 connected" &> /dev/null && connect || disconnect
