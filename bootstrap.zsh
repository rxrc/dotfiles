#!/usr/bin/env zsh

set -e
set -u

function puts () {
  echo "\n-- [$1] $2"
}

if ! [[ -d $HOME/.cache/ssh/sockets ]]; then
  mkdir -p $HOME/.cache/ssh/sockets
  puts 'Created' '~/.cache/ssh/sockets'
fi

if ! [[ -e $HOME/.gemrc ]]; then
  echo 'gem: --no-document' > $HOME/.gemrc
  puts 'Created' '~/.gemrc'
fi

if ! [[ -d $HOME/.zgen.zsh ]]; then
  puts 'Installing' 'zshrc'
  curl -L https://rc.evansosenko.com/zshrc/install.sh | sh
fi

if [[ -d $HOME/.zgen.zsh ]]; then
  puts 'Installed' 'zshrc'
fi

if ! [[ -d $HOME/.rbenv ]]; then
  puts 'Installing' 'rbenv'
  git clone https://github.com/sstephenson/rbenv.git $HOME/.rbenv
  cd $HOME/.rbenv
  git checkout $(git describe --abbrev=0 --tags)
  src/configure
  make -C src
fi

if [[ -d $HOME/.rbenv ]]; then
  puts 'Installed' 'rbenv'
fi

if ! [[ -d $HOME/.rbenv/plugins/ruby-build ]]; then
  puts 'Installing' 'ruby-build'
  git clone https://github.com/sstephenson/ruby-build.git \
    $HOME/.rbenv/plugins/ruby-build
  cd $HOME/.rbenv/plugins/ruby-build
  git checkout $(git describe --abbrev=0 --tags)
fi

if [[ -d $HOME/.rbenv/plugins/ruby-build ]]; then
  puts 'Installed' 'ruby-build'
fi

if ! [[ -d $HOME/.rbenv/plugins/rbenv-gem-rehash ]]; then
  puts 'Installing' 'rbenv-gem-rehash'
  git clone https://github.com/sstephenson/rbenv-gem-rehash.git \
    $HOME/.rbenv/plugins/rbenv-gem-rehash
fi

if [[ -d $HOME/.rbenv/plugins/rbenv-gem-rehash ]]; then
  puts 'Installed' 'rbenv-gem-rehash'
fi

if ! [[ -d $HOME/.rbenv/plugins/rbenv-default-gems ]]; then
  puts 'Installing' 'rbenv-default-gems'
  git clone https://github.com/sstephenson/rbenv-default-gems.git \
    $HOME/.rbenv/plugins/rbenv-default-gems
fi

if [[ -d $HOME/.rbenv/plugins/rbenv-default-gems ]]; then
  puts 'Installed' 'rbenv-default-gems'
fi

if ! [[ -d $HOME/.rbenv/plugins/rbenv-ctags ]]; then
  puts 'Installing' 'rbenv-ctags'
  git clone https://github.com/tpope/rbenv-ctags.git \
    $HOME/.rbenv/plugins/rbenv-ctags
fi

if [[ -d $HOME/.rbenv/plugins/rbenv-ctags ]]; then
  puts 'Installed' 'rbenv-default-gems'
fi

if ! [[ -d $HOME/.pyenv ]]; then
  puts 'Installing' 'pyenv'
  git clone https://github.com/yyuu/pyenv.git $HOME/.pyenv
  cd $HOME/.pyenv
  git checkout $(git describe --abbrev=0 --tags)
fi

if [[ -d $HOME/.pyenv ]]; then
  puts 'Installed' 'pyenv'
fi

if ! [[ -d $HOME/.pyenv/plugins/pyenv-virtualenv ]]; then
  puts 'Installing' 'pyenv-virtualenv'
  git clone https://github.com/yyuu/pyenv-virtualenv.git \
    $HOME/.pyenv/plugins/pyenv-virtualenv
  cd $HOME/.pyenv/plugins/pyenv-virtualenv
  git checkout $(git describe --abbrev=0 --tags)
fi

if [[ -d $HOME/.pyenv/plugins/pyenv-virtualenv ]]; then
  puts 'Installed' 'pyenv-virtualenv'
fi

if ! [[ -d $HOME/.nvm ]]; then
  puts 'Installing' 'nvm'
  git clone https://github.com/creationix/nvm.git $HOME/.nvm
  cd $HOME/.nvm
  git checkout $(git describe --abbrev=0 --tags)
fi

if [[ -d $HOME/.nvm ]]; then
  puts 'Installed' 'nvm'
fi

if ! [[ -d $HOME/.vim/plugged/vimrc ]]; then
  puts 'Installing' 'vimrc'
  curl -L https://rc.evansosenko.com/vimrc/install.sh | sh
fi

if [[ -d $HOME/.vim/plugged/vimrc ]]; then
  puts 'Installed' 'vimrc'
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

if ! [[ -e $HOME/.promptline.zsh ]]; then
  if [[ -d $HOME/.vim/plugged/promptline.vim ]]; then
    puts 'Installing' 'promptline'
    vim -c "PromptlineSnapshot ~/.promptline.zsh" -c qall!
  fi
fi

if [[ -e $HOME/.promptline.zsh ]]; then
  puts 'Installed' 'promptline'
fi

if ! [[ -e $HOME/.tmuxline.conf ]] then
  if [[ -d $HOME/.vim/plugged/tmuxline.vim ]]; then
    if [[ ! -z "${TMUX:-}" ]]; then
      puts 'Installing' 'tmuxline'
      vim -c "TmuxlineSnapshot ~/.tmuxline.conf" -c qall!
    else
      puts 'Info' 'Run in a tmux session to install tmuxline.'
    fi
  fi
fi

if [[ -e $HOME/.tmuxline.conf ]]; then
  puts 'Installed' 'tmuxline'
fi

exit
