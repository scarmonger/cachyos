#!/bin/bash

LAST=""

while true; do
  STATUS=$(dropbox status)

  if [ "$STATUS" != "$LAST" ]; then
    notify-send "Dropbox Status" "$STATUS"
    LAST="$STATUS"
  fi

  sleep 10
done
