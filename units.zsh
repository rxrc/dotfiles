#!/usr/bin/env zsh

enabled=()
disabled=()
environment=()

for unit in $enabled; do
  echo "Enable: $unit"
  systemctl --user enable $unit
done

for unit in $disabled; do
  echo "Disable: $unit"
  sudo systemctl --user disable $unit
done

for unit in $environment; do
  echo "Set: $unit"
  systemctl --user set-environment $unit
done

exit 0
