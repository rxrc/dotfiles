#!/usr/bin/env zsh

enabled=()
disabled=()

command -v systemctl >/dev/null 2>&1 || exit 0

for unit in $enabled; do
  echo "[Enable] $unit"
  systemctl --user enable $unit
done

for unit in $disabled; do
  echo "[Disable] $unit"
  sudo systemctl --user disable $unit
done

exit 0
