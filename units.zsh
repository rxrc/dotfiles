#!/usr/bin/env zsh

enabled=()
disabled=()

enabled+=('app@nm-applet')
enabled+=('app@unclutter')
enabled+=('dbus')
enabled+=('insync')
enabled+=("keymap@$(hostname)")
enabled+=('numlock')
enabled+=('pulseaudio.socket')
enabled+=('redshift-gtk')
enabled+=('tmuxinator@default')
enabled+=('tmuxinator@glances')
enabled+=('tmuxinator@hangups')
enabled+=('xinit.target')
enabled+=('xresources')
enabled+=('xresources@urxvt')
enabled+=('xresources@urxvt.interface')
enabled+=('xresources@urxvt.solarized')

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
