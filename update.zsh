#!/usr/bin/env zsh

set -e
set -u

function puts () {
  echo "\n-- [$1] $2"
}

if [[ $(command -v gem) ]]; then
  puts 'Updating' 'gems'
  xargs -a dotfiles/rbenv/default-gems gem install
  xargs -a dotfiles/rbenv/default-gems gem update
fi

if [[ $(command -v pyenv) ]]; then
  puts 'Updating' 'pip and pipenv'
  pyenv exec pip install --upgrade pip pipenv
fi

if [[ -d $HOME/.zgen.zsh ]]; then
  puts 'Updating' 'zgen'
  cd $HOME/.zgen.zsh
  git pull
fi

if [[ -d $HOME/.rbenv ]]; then
  puts 'Updating' 'rbenv'
  cd $HOME/.rbenv
  git checkout master
  git pull
  git checkout $(git describe --abbrev=0 --tags)
  src/configure
  make -C src
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

if [[ -d $HOME/.rbenv/plugins/rbenv-bundler ]]; then
  puts 'Updating' 'rbenv-bundler'
  cd $HOME/.rbenv/plugins/rbenv-bundler
  git checkout master
  git pull
  git checkout $(git describe --abbrev=0 --tags)
  $HOME/.rbenv/bin/rbenv bundler on
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

if [[ -e $HOME/.promptline.sh ]]; then
  puts 'Updating' 'promptline'
  nvim -c "PromptlineSnapshot! ~/.promptline.sh" -c qall!
fi

if [[ -e $HOME/.tmuxline.conf ]]; then
  if [[ ! -z "${TMUX:-}" ]]; then
    puts 'Updating' 'tmuxline'
    nvim -c "Tmuxline airline" -c "TmuxlineSnapshot! ~/.tmuxline.conf" -c qall!
  else
    puts 'Info' 'Run in a tmux session to install tmuxline.'
  fi
fi

exit
