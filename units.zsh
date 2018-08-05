#!/usr/bin/env zsh

set -e
set -u

enabled=()
disabled=()

command -v systemctl >/dev/null 2>&1 || exit 0

enabled+=('app@screencloud')
enabled+=('app@unclutter')
enabled+=('insync')
enabled+=("keymap@$(hostname)")
enabled+=('xscreensaver')
enabled+=('numlock')
enabled+=('pulseaudio.socket')
enabled+=('ssh-agent')
enabled+=('transmission-gtk')
enabled+=('urxvtd')
enabled+=('wm.target')
enabled+=('xinit.target')
enabled+=('xresources')

if [[ -e $HOME/.config/xbindkeys/xbindkeysrc ]]; then
  enabled+=('xbindkeys')
fi

if [[ $(hostname) != 'Mimir' ]]; then
  # enabled+=('redshift-gtk')
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
