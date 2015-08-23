#!/usr/bin/env zsh

set -e

function puts () {
  echo "\n-- [$1] $2"
}

if [[ -d $HOME/.zgen.zsh ]]; then
  puts 'Updating' 'zgen'
  cd $HOME/.zgen.zsh
  git pull
fi

if [[ -d $HOME/.rbenv ]]; then
  puts 'Updating' 'rbenv'
  cd $HOME/.rbenv
  git pull
fi

if [[ -d $HOME/.rbenv/plugins/ruby-build ]]; then
  puts 'Updating' 'ruby-build'
  cd $HOME/.rbenv/plugins/ruby-build
  git fetch
  git checkout $(git describe --abbrev=0 --tags)
fi

if [[ -e $HOME/.promptline.zsh ]]; then
  puts 'Updating' 'promptline'
  vim -c "PromptlineSnapshot! ~/.promptline.zsh" -c qall!
fi

if [[ -e $HOME/.tmuxline.conf ]]; then
  if [[ -n "$TMUX" ]]; then
    puts 'Updating' 'tmuxline'
    vim -c "TmuxlineSnapshot! ~/.tmuxline.conf" -c qall!
  else
    puts 'Info' 'Run in a tmux session to install tmuxline.'
  fi
fi

exit 0
