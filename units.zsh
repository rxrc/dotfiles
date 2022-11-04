#!/usr/bin/env zsh

set -e
set -u

enabled=()
disabled=()

command -v systemctl >/dev/null 2>&1 || exit 0

enabled+=("keymap@$(hostname)")
enabled+=('app@unclutter')
enabled+=('app@flameshot')
enabled+=('geoclue-agent')
enabled+=('insync')
enabled+=('numlock')
enabled+=('pulseaudio.socket')
enabled+=('redshift-gtk')
enabled+=('ssh-agent')
enabled+=('urxvtd')
enabled+=('wm.target')
enabled+=('xinit.target')
enabled+=('xresources')
enabled+=('darkman')
enabled+=('docker-desktop')

if [[ -e $HOME/.config/xbindkeys/xbindkeysrc ]]; then
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

exit
