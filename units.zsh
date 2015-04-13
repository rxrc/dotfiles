#!/usr/bin/env zsh

enabled=()
disabled=()

enabled+=( 'awesome.service' )
enabled+=( 'dbus.service' )
enabled+=( 'keymap.service' )
enabled+=( 'NetworkManager-applet.service' )

for unit in $enabled; do
  echo "[Enable] $unit"
  systemctl --user enable $unit
done

for unit in $disabled; do
  echo "[Disable] $unit"
  sudo systemctl --user disable $unit
done

exit 0
