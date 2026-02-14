#!/usr/bin/env zsh

set -e
set -u

XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

function puts () {
  echo "\n-- [$1] $2"
}

if [[ -d $HOME/.zgen.zsh ]]; then
  puts 'Updating' 'zgen'
  cd $HOME/.zgen.zsh
  git pull
fi

if [[ -e $HOME/.config/zsh/promptline.zsh ]]; then
  puts 'Updating' 'promptline'
  nvim -c "PromptlineSnapshot ~/.config/zsh/promptline.zsh" -c qall!
fi

exit
