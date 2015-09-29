#!/usr/bin/env zsh

set -e
set -u

enabled=()
disabled=()

command -v systemctl >/dev/null 2>&1 || exit 0

enabled+=('app@screencloud')
enabled+=('app@unclutter')
enabled+=('hexchat')
enabled+=('insync')
enabled+=("keymap@$(hostname)")
enabled+=('xscreensaver')
enabled+=('numlock')
enabled+=('pulseaudio.socket')
enabled+=('redshift-gtk')
enabled+=('ssh-agent')
enabled+=('tmuxinator@default')
enabled+=('tmuxinator@glances')
enabled+=('urxvtd')
enabled+=('wm.target')
enabled+=('xinit.target')
enabled+=('xresources')

if [[ $(hostname) == 'Sleipnir' ]]; then
  enabled+=('deluge')
else
  enabled+=('transmission-gtk')
fi

if (pacman -Q network-manager-applet &>/dev/null); then
  enabled+=('app@nm-applet')
fi

if [[ -e /usr/local/bin/mntxd ]]; then
  enabled+=('rbenv-ruby@mntxd')
fi

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
