if [[ -z $DISPLAY && $XDG_VTNR -eq 6 ]]; then
  chvt 6
  exec startx
fi
