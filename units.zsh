#!/usr/bin/env zsh

enabled=()
disabled=()

enabled+=('app@nm-applet')
enabled+=('app@qhangups')
enabled+=('app@unclutter')
enabled+=('dbus')
enabled+=('insync')
enabled+=("keymap@$(hostname)")
enabled+=('numlock')
enabled+=('pulseaudio.socket')
enabled+=('redshift-gtk')
enabled+=('xinit.target')

if [[ -e ~/.xbindkeysrc ]]; then
  enabled+=('xbindkeys')
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
