#!/usr/bin/env zsh

set -e
set -u

cmd="${1:=install}"

if [[ "$cmd" = 'config' ]]; then
  rbenv exec bundle exec curate -v
  ./units.zsh
  exit
fi

echo '$ ./bootstrap.zsh'
./bootstrap.zsh

echo "\n $ npm install"
npm install
[[ "$cmd" = 'update' ]] && echo "\n $ npm run update"
[[ "$cmd" = 'update' ]] && npm run update

echo "\n$ bundle ${cmd}\n"
command -v bundle || gem install bundler
[[ "$cmd" = 'update' ]] && gem update bundler
rbenv exec bundle $cmd

echo '\n$ curate -v\n'
rbenv exec bundle exec curate -v

echo '\n$ ./update.zsh'
./update.zsh

echo '\n$ ./units.zsh'
./units.zsh

echo "\n$ ./node-modules.zsh"
./node-modules.zsh

echo '\n$ ./vagrant-plugins.zsh'
./vagrant-plugins.zsh
[[ "$cmd" = 'update' ]] && echo "\n $ vagrant plugin update"
[[ "$cmd" = 'update' ]] && vagrant plugin update

exit
