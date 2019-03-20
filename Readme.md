1. Udev Rule configuration: 
a) Create HDMI dev rule:
`vim /etc/udev/rules.d/95-HDMI2.rules`
b)Content of file:
```
ACTION=="change", SUBSYSTEM=="drm", RUN+="/opt/bin/hotplug_HDMI2.sh"
```

2. Create script to launch when display is detected:
a) HDMI script location
`vim /opt/bin/hotplug_HDMI2.sh`
b)Content of file:

Example:

```
#! /usr/bin/bash

export DISPLAY=:0
export XAUTHORITY=/opt/player/.Xauthority

function connect(){
    xrandr --output HDMI2 --mode 1920x1080 && /usr/bin/supervisorctl restart myapp 
}

function disconnect(){
      xrandr --output HDMI2 --off
}

xrandr | grep "HDMI2 connected" &> /dev/null && connect || disconnect
```

i) You might need to edit the name of output (once the monitor is connected and turned on use player user and launch xrandr to get identifier for the display)

ii) You will need to change the supervisor monitored application that is restarted once the script is launched (/usr/bin/supervisorctl restart coke-carrefour-reboot)

Original post this solution was created from:
https://www.google.com/search?client=firefox-b-ab&q=udev+rules
https://bbs.archlinux.org/viewtopic.php?id=170294
