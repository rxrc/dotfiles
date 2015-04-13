#!/usr/bin/env zsh

enabled=()
disabled=()

enabled+=( 'app@nm-applet' )
enabled+=( 'app@unclutter' )
enabled+=( 'app@xbindkeys' )
enabled+=( 'xinit.target' )
enabled+=( 'insync' )
enabled+=( 'keymap' )
enabled+=( 'redshift-gtk' )

if [[ -e ~/.xbindkeysrc ]]; then
  enabled+=( 'xbindkeys' )
fi

for unit in $enabled; do
  echo "[Enable] $unit"
  systemctl --user enable $unit
done

for unit in $disabled; do
  echo "[Disable] $unit"
  sudo systemctl --user disable $unit
done

exit 0
