#!/usr/bin/env zsh

enabled=()
disabled=()

enabled+=( 'dbus.service' )
enabled+=( 'awesome.service' )

for unit in $enabled; do
  echo "Enable: $unit"
  systemctl --user enable $unit
done

for unit in $disabled; do
  echo "Disable: $unit"
  sudo systemctl --user disable $unit
done

exit 0
