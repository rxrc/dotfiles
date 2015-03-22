#!/usr/bin/env zsh

set -e

function puts () {
  echo "\n-- [$1] $2"
}

if [[ -d ~/.zgen.zsh ]]; then
  puts 'Updating' 'zgen'
  cd ~/.zgen.zsh
  git pull
fi

if [[ -d ~/.rbenv ]]; then
  puts 'Updating' 'rbenv'
  cd ~/.rbenv
  git pull
fi

if [[ -d ~/.rbenv/plugins/ruby-build ]]; then
  puts 'Updating' 'ruby-build'
  cd ~/.rbenv/plugins/ruby-build
  git pull
fi

if [[ -e ~/.promptline.zsh ]]; then
  puts 'Note' 'To update promptline, open vim and run:'
  echo ":PromptlineSnapshot! ~/.promptline.zsh"
fi

if [[ -e ~/.tmuxline.conf ]]; then
  puts 'Note' 'To update tmuxline, while in a tmux session open vim and run:'
  echo ":TmuxlineSnapshot! ~/.tmuxline.conf"
fi

exit 0
