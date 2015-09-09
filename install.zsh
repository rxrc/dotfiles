#!/usr/bin/env zsh

set -e
set -u

cmd="${1:=install}"

if [[ "$cmd" = 'config' ]]; then
  curate -v
  ./units.zsh
  exit
fi

echo '$ ./bootstrap.zsh'
./bootstrap.zsh

echo "\n$ ./npm_modules.zsh ${cmd}"
./npm_modules.zsh $cmd

echo "\n$ bower ${cmd}\n"
$(npm bin -g)/bower $cmd

echo "\n$ bundle ${cmd}\n"
command -v bundle || gem install bundler
[[ "$cmd" = 'update' ]] && gem update bundler
rbenv exec bundle $cmd

echo '\n$ curate -v\n'
bundle exec curate -v

echo '\n$ ./update.zsh'
./update.zsh

echo '\n$ ./units.zsh'
./units.zsh

echo '\n$ ./vagrant_plugins.zsh'
./vagrant_plugins.zsh

exit
