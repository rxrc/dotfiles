#!/usr/bin/env zsh

set -e
set -u

XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
NVM_DIR=${NVM_DIR:-$XDG_DATA_HOME/nvm}

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

if [[ -e $HOME/.config/tmux/tmuxline.conf ]]; then
  if [[ ! -z "${TMUX:-}" ]]; then
    puts 'Updating' 'tmuxline'
    nvim -c "Tmuxline airline" -c "TmuxlineSnapshot! ~/.config/tmux/tmuxline.conf" -c qall!
  else
    puts 'Info' 'Run in a tmux session to install tmuxline.'
  fi
fi

exit
