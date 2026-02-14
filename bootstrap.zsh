#!/usr/bin/env zsh

set -e
set -u

XDG_DATA_HOME=${XDG_DATA_HOME:-$HOME/.local/share}

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
  puts 'Created' '~/.config/zsh/env.zsh'
fi

if ! [[ -e $HOME/.gemrc ]]; then
  echo 'gem: --no-document' > $HOME/.gemrc
  puts 'Created' '~/.gemrc'
fi

if ! [[ -d $HOME/.config/zplug ]]; then
  puts 'Installing' 'zshrc'
  cp dotfiles/zshenv $HOME/.zshenv
  curl -L https://rc.evansosenko.com/zshrc/install.sh | sh
fi

if ! [[ -d $HOME/.config/zplug ]]; then
  puts 'Installed' 'zshrc'
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

if ! [[ -e $HOME/.config/zsh/promptline.zsh ]]; then
  if [[ -d $HOME/.config/nvim/plugged/promptline.vim ]]; then
    puts 'Installing' 'promptline'
    nvim -c "PromptlineSnapshot ~/.config/zsh/promptline.zsh" -c qall!
  fi
fi

if [[ -e $HOME/.config/zsh/promptline.zsh ]]; then
  puts 'Installed' 'promptline'
fi

exit
