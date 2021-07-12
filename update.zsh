#!/usr/bin/env zsh

set -e
set -u

XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}
NVM_DIR=${NVM_DIR:-$XDG_DATA_HOME/nvm}
PYENV_ROOT=${PYENV_ROOT:-$XDG_DATA_HOME/pyenv}
RBENV_ROOT=${RBENV_ROOT:-$XDG_DATA_HOME/rbenv}

function puts () {
  echo "\n-- [$1] $2"
}

if [[ $(command -v gem) ]]; then
  puts 'Updating' 'gems'
  xargs -a config/rbenv/default-gems gem install
  xargs -a config/rbenv/default-gems gem update
fi

if [[ $(command -v pyenv) ]]; then
  puts 'Updating' 'pip and pipenv'
  pyenv exec pip install --upgrade pip
fi

if [[ -d $HOME/.zgen.zsh ]]; then
  puts 'Updating' 'zgen'
  cd $HOME/.zgen.zsh
  git pull
fi

if [[ -d $RBENV_ROOT ]]; then
  puts 'Updating' 'rbenv'
  cd $RBENV_ROOT
  git checkout master
  git pull
  git checkout $(git describe --abbrev=0 --tags)
  src/configure
  make -C src
fi

if [[ -d $RBENV_ROOT/plugins/ruby-build ]]; then
  puts 'Updating' 'ruby-build'
  cd $RBENV_ROOT/plugins/ruby-build
  git checkout master
  git pull
  git checkout $(git describe --abbrev=0 --tags)
fi

if [[ -d $RBENV_ROOT/plugins/rbenv-gem-rehash ]]; then
  puts 'Updating' 'rbenv-gem-rehash'
  cd $RBENV_ROOT/plugins/rbenv-gem-rehash
  git pull
fi

if [[ -d $RBENV_ROOT/plugins/rbenv-default-gems ]]; then
  puts 'Updating' 'rbenv-default-gems'
  cd $RBENV_ROOT/plugins/rbenv-default-gems
  git pull
fi

if [[ -d $RBENV_ROOT/plugins/rbenv-ctags ]]; then
  puts 'Updating' 'rbenv-ctags'
  cd $RBENV_ROOT/plugins/rbenv-ctags
  git pull
fi

if [[ -d $RBENV_ROOT/plugins/rbenv-bundler ]]; then
  puts 'Updating' 'rbenv-bundler'
  cd $RBENV_ROOT/plugins/rbenv-bundler
  git checkout main
  git pull
  git checkout $(git describe --abbrev=0 --tags)
  $RBENV_ROOT/bin/rbenv bundler on
fi

if [[ -d $PYENV_ROOT ]]; then
  puts 'Updating' 'pyenv'
  cd $PYENV_ROOT
  git checkout master
  git pull
  git checkout $(git describe --abbrev=0 --tags)
fi

if [[ -d $PYENV_ROOT/plugins/pyenv-virtualenv ]]; then
  puts 'Updating' 'pyenv-virtualenv'
  cd $PYENV_ROOT/plugins/pyenv-virtualenv
  git checkout master
  git pull
  git checkout $(git describe --abbrev=0 --tags)
fi

if [[ -d $NVM_DIR ]]; then
  puts 'Updating' 'nvm'
  cd $NVM_DIR
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
