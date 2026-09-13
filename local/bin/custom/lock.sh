#!/bin/bash
scrot /tmp/screen.png

 Pixelate image
 convert /tmp/screen.png -scale 10% -scale 1000% /tmp/screen.png
 [[ -f $1 ]] && convert /tmp/screen.png $1 -gravity center -composite -matte /tmp/screen.png

# Blur image
# convert /tmp/screen.png -blur 0x4 /tmp/screen.png

#dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Stop
i3lock -i /tmp/screen.png
rm /tmp/screen.png
