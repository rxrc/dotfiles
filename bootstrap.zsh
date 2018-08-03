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

if ! [[ -d $XDG_DATA_HOME ]]; then
  mkdir -p $XDG_DATA_HOME
fi

if ! [[ -d $HOME/.cache/ssh/sockets ]]; then
  mkdir -p $HOME/.cache/ssh/sockets
  puts 'Created' '~/.cache/ssh/sockets'
fi

if ! [[ -e $HOME/.config/zsh/env.zsh ]]; then
  mkdir -p $HOME/.config/zsh
  touch $HOME/.config/zsh/env.zsh
  puts 'Created' '~/.gemrc'
fi

if ! [[ -e $HOME/.gemrc ]]; then
  echo 'gem: --no-document' > $HOME/.gemrc
  puts 'Created' '~/.gemrc'
fi

if ! [[ -d $HOME/.config/zplug ]]; then
  puts 'Installing' 'zshrc'
  curl -L https://rc.evansosenko.com/zshrc/install.sh | sh
fi

if ! [[ -d $HOME/.config/zplug ]]; then
  puts 'Installed' 'zshrc'
fi

if ! [[ -d $RBENV_ROOT ]]; then
  puts 'Installing' 'rbenv'
  git clone https://github.com/sstephenson/rbenv.git $RBENV_ROOT
  cp -p config/rbenv/default-gems $RBENV_ROOT
  cd $RBENV_ROOT
  git checkout $(git describe --abbrev=0 --tags)
  src/configure
  make -C src
fi

if [[ -d $RBENV_ROOT ]]; then
  puts 'Installed' 'rbenv'
fi

if ! [[ -d $RBENV_ROOT/plugins/ruby-build ]]; then
  puts 'Installing' 'ruby-build'
  git clone https://github.com/sstephenson/ruby-build.git \
    $RBENV_ROOT/plugins/ruby-build
  cd $RBENV_ROOT/plugins/ruby-build
  git checkout $(git describe --abbrev=0 --tags)
fi

if [[ -d $RBENV_ROOT/plugins/ruby-build ]]; then
  puts 'Installed' 'ruby-build'
fi

if ! [[ -d $RBENV_ROOT/plugins/rbenv-gem-rehash ]]; then
  puts 'Installing' 'rbenv-gem-rehash'
  git clone https://github.com/sstephenson/rbenv-gem-rehash.git \
    $RBENV_ROOT/plugins/rbenv-gem-rehash
fi

if [[ -d $RBENV_ROOT/plugins/rbenv-gem-rehash ]]; then
  puts 'Installed' 'rbenv-gem-rehash'
fi

if ! [[ -d $RBENV_ROOT/plugins/rbenv-default-gems ]]; then
  puts 'Installing' 'rbenv-default-gems'
  git clone https://github.com/sstephenson/rbenv-default-gems.git \
    $RBENV_ROOT/plugins/rbenv-default-gems
fi

if [[ -d $RBENV_ROOT/plugins/rbenv-default-gems ]]; then
  puts 'Installed' 'rbenv-default-gems'
fi

if ! [[ -d $RBENV_ROOT/plugins/rbenv-ctags ]]; then
  puts 'Installing' 'rbenv-ctags'
  git clone https://github.com/tpope/rbenv-ctags.git \
    $RBENV_ROOT/plugins/rbenv-ctags
fi

if [[ -d $RBENV_ROOT/plugins/rbenv-ctags ]]; then
  puts 'Installed' 'rbenv-default-ctags'
fi

if ! [[ -d $RBENV_ROOT/plugins/rbenv-bundler ]]; then
  puts 'Installing' 'rbenv-bundler'
  git clone https://github.com/carsomyr/rbenv-bundler.git \
    $RBENV_ROOT/plugins/rbenv-bundler
  cd $RBENV_ROOT/plugins/rbenv-bundler
  git checkout $(git describe --abbrev=0 --tags)
  $RBENV_ROOT/bin/rbenv bundler on
fi

if [[ -d $RBENV_ROOT/plugins/rbenv-bundler ]]; then
  puts 'Installed' 'rbenv-bundler'
fi

if ! [[ -d $PYENV_ROOT ]]; then
  puts 'Installing' 'pyenv'
  git clone https://github.com/yyuu/pyenv.git $PYENV_ROOT
  cd $PYENV_ROOT
  git checkout $(git describe --abbrev=0 --tags)
fi

if [[ -d $PYENV_ROOT ]]; then
  puts 'Installed' 'pyenv'
fi

if ! [[ -d $PYENV_ROOT/plugins/pyenv-virtualenv ]]; then
  puts 'Installing' 'pyenv-virtualenv'
  git clone https://github.com/yyuu/pyenv-virtualenv.git \
    $PYENV_ROOT/plugins/pyenv-virtualenv
  cd $PYENV_ROOT/plugins/pyenv-virtualenv
  git checkout $(git describe --abbrev=0 --tags)
fi

if [[ -d $PYENV_ROOT/plugins/pyenv-virtualenv ]]; then
  puts 'Installed' 'pyenv-virtualenv'
fi

if ! [[ -d $NVM_DIR ]]; then
  puts 'Installing' 'nvm'
  git clone https://github.com/creationix/nvm.git $NVM_DIR
  cd $NVM_DIR
  git checkout $(git describe --abbrev=0 --tags)
fi

if [[ -d $NVM_DIR ]]; then
  puts 'Installed' 'nvm'
fi

if ! [[ -h $HOME/.local/share/nvim/site/spell ]]; then
  mkdir -p $HOME/.local/share/nvim/site
  if [[ -d /usr/share/vim/vimfiles/spell ]]; then
    ln -s /usr/share/vim/vimfiles/spell $HOME/.local/share/nvim/site
  fi
fi

if ! [[ -d $HOME/.config/nvim/plugged/nvimrc ]]; then
  puts 'Installing' 'nvimrc'
  curl -L https://rc.evansosenko.com/nvimrc/install.sh | sh
fi

if [[ -d $HOME/.config/nvim/plugged/nvimrc ]]; then
  puts 'Installed' 'nvimrc'
fi

if ! [[ -d $HOME/.tmux/plugins/tmuxrc ]]; then
  if [[ ! -z "${TMUX:-}" ]]; then
    puts 'Installing' 'tmuxrc'
    curl -L https://rc.evansosenko.com/tmuxrc/install.sh | sh
    puts 'Installed' 'tmux plugins'
  else
    puts 'Info' 'Run in a tmux session to install tmuxrc.'
  fi
fi

if [[ -d $HOME/.tmux/plugins/tmuxrc ]]; then
  puts 'Installed' 'tmuxrc'
fi

if ! [[ -e $HOME/.config/zsh/promptline.zsh ]]; then
  if [[ -d $HOME/.config/nvim/plugged/promptline.vim ]]; then
    puts 'Installing' 'promptline'
    nvim -c "PromptlineSnapshot ~/.config/zsh/promptline.zsh" -c qall!
  fi
fi

if [[ -e $HOME/.promptline.sh ]]; then
  puts 'Installed' 'promptline'
fi

if ! [[ -e $HOME/.tmuxline.conf ]] then
  if [[ -d $HOME/.config/nvim/plugged/tmuxline.vim ]]; then
    if [[ ! -z "${TMUX:-}" ]]; then
      puts 'Installing' 'tmuxline'
      nvim -c "TmuxlineSnapshot ~/.tmuxline.conf" -c qall!
    else
      puts 'Info' 'Run in a tmux session to install tmuxline.'
    fi
  fi
fi

if [[ -e $HOME/.tmuxline.conf ]]; then
  puts 'Installed' 'tmuxline'
fi

# TODO: See https://github.com/neovim/neovim/wiki/FAQ#my-ctrl-h-mapping-doesnt-work
if [[ ! -z "${TMUX:-}" ]]; then
  puts 'Patching' 'terminfo'
  infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > $TERM.ti
  tic $TERM.ti
  rm $TERM.ti
else
  puts 'Info' 'Run in a tmux session to patch terminfo.'
fi

exit
