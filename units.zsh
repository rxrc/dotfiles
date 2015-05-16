#!/usr/bin/env zsh

enabled=()
disabled=()

command -v systemctl >/dev/null 2>&1 || exit 0

enabled+=('app@nm-applet')
enabled+=('app@unclutter')
enabled+=('dbus')
enabled+=('hexchat')
enabled+=('insync')
enabled+=("keymap@$(hostname)")
enabled+=('numlock')
enabled+=('pulseaudio.socket')
enabled+=('redshift-gtk')
enabled+=('ssh-agent')
enabled+=('tmuxinator@default')
enabled+=('tmuxinator@glances')
enabled+=('tmuxinator@hangups')
enabled+=('tmuxinator@ranger')
enabled+=('urxvtd')
enabled+=('wm.target')
enabled+=('xinit.target')
enabled+=('xresources')

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

exit 0
