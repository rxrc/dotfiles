#!/usr/bin/env zsh

set -e

function puts () {
  echo "\n-- [$1] $2"
}

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

if ! [[ -d $HOME/.vim/plugged/vimrc ]]; then
  puts 'Installing' 'vimrc'
  curl -L https://rc.evansosenko.com/vimrc/install.sh | sh
fi

if [[ -d $HOME/.vim/plugged/vimrc ]]; then
  puts 'Installed' 'vimrc'
fi

if ! [[ -d $HOME/.tmux/plugins/tmuxrc ]]; then
  if [[ -n "$TMUX" ]]; then
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
    puts 'Note' 'To install promptline, open vim and run:'
    echo ":PromptlineSnapshot ~/.promptline.zsh"
  fi
fi

if [[ -e $HOME/.promptline.zsh ]]; then
  puts 'Installed' 'promptline'
fi

if ! [[ -e $HOME/.tmuxline.conf ]] then
  if [[ -d $HOME/.vim/plugged/tmuxline.vim ]]; then
    puts 'Note' 'To install tmuxline, while in a tmux session open vim and run:'
    echo ":TmuxlineSnapshot ~/.tmuxline.conf"
  fi
fi

if [[ -e $HOME/.tmuxline.conf ]]; then
  puts 'Installed' 'tmuxline'
fi

exit 0
