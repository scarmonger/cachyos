#!/bin/sh

export XAUTHORITY=/home/mc/.Xauthority
export DISPLAY=:0
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

# /usr/bin/sudo -u mc /usr/bin/paplay --server=/run/user/1000/pulse/native /home/mc/noah.mp4 > /dev/null 2>&1
/usr/bin/sudo -u mc /usr/bin/mpv /home/mc/noah.mp4 > /dev/null 2>&1

/usr/bin/notify-send --icon=/usr/share/icons/gnome/256x256/status/battery-full-charging.png 'Changing Power States' --expire-time=4000
