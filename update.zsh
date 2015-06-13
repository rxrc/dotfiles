#!/usr/bin/env zsh

set -e

function puts () {
  echo "\n-- [$1] $2"
}

if [[ $(command -v pyenv) ]]; then
  puts 'Updating' 'pip'
  pyenv exec pip install --upgrade pip
fi

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

if [[ -d $HOME/.rbenv/plugins/rbenv-gem-rehash ]]; then
  puts 'Updating' 'rbenv-gem-rehash'
  cd $HOME/.rbenv/plugins/rbenv-gem-rehash
  git pull
fi

if [[ -d $HOME/.rbenv/plugins/rbenv-default-gems ]]; then
  puts 'Updating' 'rbenv-default-gems'
  cd $HOME/.rbenv/plugins/rbenv-default-gems
  git pull
fi

if [[ -d $HOME/.pyenv ]]; then
  puts 'Updating' 'pyenv'
  cd $HOME/.pyenv
  git fetch
  git checkout $(git describe --abbrev=0 --tags)
fi

if [[ -d $HOME/.pyenv/plugins/pyenv-virtualenv ]]; then
  puts 'Updating' 'pyenv-virtualenv'
  cd $HOME/.pyenv/plugins/pyenv-virtualenv
  git fetch
  git checkout $(git describe --abbrev=0 --tags)
fi

if [[ -d $HOME/.nvm ]]; then
  puts 'Updating' 'nvm'
  cd $HOME/.nvm
  git fetch
  git checkout $(git describe --abbrev=0 --tags)
fi

if [[ -e $HOME/.promptline.zsh ]]; then
  puts 'Note' 'To update promptline, open vim and run:'
  echo ":PromptlineSnapshot! ~/.promptline.zsh"
fi

if [[ -e $HOME/.tmuxline.conf ]]; then
  puts 'Note' 'To update tmuxline, while in a tmux session open vim and run:'
  echo ":TmuxlineSnapshot! ~/.tmuxline.conf"
fi

exit 0
