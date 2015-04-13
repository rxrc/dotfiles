#!/usr/bin/env zsh

enabled=()
disabled=()

enabled+=( 'app@nm-applet' )
enabled+=( 'app@unclutter' )
enabled+=( 'awesome' )
enabled+=( 'dbus' )
enabled+=( 'insync' )
enabled+=( 'keymap' )

for unit in $enabled; do
  echo "[Enable] $unit"
  systemctl --user enable $unit
done

for unit in $disabled; do
  echo "[Disable] $unit"
  sudo systemctl --user disable $unit
done

exit 0
