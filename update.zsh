#!/usr/bin/env zsh

set -e
set -u

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
  git checkout master
  git pull
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

if [[ -d $HOME/.rbenv/plugins/rbenv-ctags ]]; then
  puts 'Updating' 'rbenv-ctags'
  cd $HOME/.rbenv/plugins/rbenv-ctags
  git pull
fi

if [[ -d $HOME/.pyenv ]]; then
  puts 'Updating' 'pyenv'
  cd $HOME/.pyenv
  git checkout master
  git pull
  git checkout $(git describe --abbrev=0 --tags)
fi

if [[ -d $HOME/.pyenv/plugins/pyenv-virtualenv ]]; then
  puts 'Updating' 'pyenv-virtualenv'
  cd $HOME/.pyenv/plugins/pyenv-virtualenv
  git checkout master
  git pull
  git checkout $(git describe --abbrev=0 --tags)
fi

if [[ -d $HOME/.nvm ]]; then
  puts 'Updating' 'nvm'
  cd $HOME/.nvm
  git checkout master
  git pull
  git checkout $(git describe --abbrev=0 --tags)
fi

if [[ -e $HOME/.promptline.zsh ]]; then
  puts 'Updating' 'promptline'
  vim -c "PromptlineSnapshot! ~/.promptline.zsh" -c qall!
fi

if [[ -e $HOME/.tmuxline.conf ]]; then
  if [[ ! -z "${TMUX:-}" ]]; then
    puts 'Updating' 'tmuxline'
    vim -c "TmuxlineSnapshot! ~/.tmuxline.conf" -c qall!
  else
    puts 'Info' 'Run in a tmux session to install tmuxline.'
  fi
fi

exit
