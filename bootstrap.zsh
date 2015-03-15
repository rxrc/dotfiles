#!/usr/bin/env zsh

function puts () {
  echo "\n-- [$1] $2"
}

if ! [[ -d ~/.zgen.zsh ]]; then
  puts 'Installing' 'zshrc'
  curl -L https://io.evansosenko.com/zshrc/install.sh | sh
fi

if [[ -d ~/.zgen.zsh ]]; then
  puts 'Installed' 'zshrc'
fi

if ! [[ -d ~/.rbenv ]]; then
  puts 'Installing' 'rbenv'
  git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
fi

if [[ -d ~/.rbenv ]]; then
  puts 'Installed' 'rbenv'
fi

if ! [[ -d ~/.rbenv/plugins/ruby-build ]]; then
  puts 'Installing' 'ruby-build'
  git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
fi

if [[ -d ~/.rbenv/plugins/ruby-build ]]; then
  puts 'Installed' 'ruby-build'
fi

if ! [[ -d ~/.vim/bundle/vimrc ]]; then
  puts 'Installing' 'vimrc'
  curl -L https://io.evansosenko.com/vimrc/install.sh | sh
fi

if [[ -d ~/.vim/bundle/vimrc ]]; then
  puts 'Installed' 'vimrc'
fi

if ! [[ -d ~/.tmux/plugins/tmuxrc ]]; then
  if [[ -n "$TMUX" ]]; then
    puts 'Installing' 'tmuxrc'
    curl -L https://io.evansosenko.com/tmuxrc/install.sh | sh
    puts 'Installed' 'tmux plugins'
  else
    puts 'Info' 'Run in a tmux session to install tmuxrc.'
  fi
fi

if [[ -d ~/.tmux/plugins/tmuxrc ]]; then
  puts 'Installed' 'tmuxrc'
fi

if ! [[ -e ~/.promptline.zsh ]]; then
  if [[ -d ~/.vim/bundle/promptline.vim ]]; then
    puts 'Note' 'To install promptline, open vim and run:'
    echo ":PromptlineSnapshot ~/.promptline.zsh"
  fi
fi

if [[ -e ~/.promptline.zsh ]]; then
  puts 'Installed' 'promptline'
fi

if ! [[ -e ~/.tmuxline.conf ]] then
  puts 'Note' 'To install tmuxline, while in a tmux session open vim and run:'
  echo ":TmuxlineSnapshot ~/.tmuxline.conf"
fi

if [[ -e ~/.tmuxline.conf ]]; then
  puts 'Installed' 'tmuxline'
fi

exit 0
