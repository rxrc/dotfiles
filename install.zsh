#!/usr/bin/env zsh

set -e

if [[ "$1" == 'update' ]]; then
  cmd='update'
else
  cmd='install'
fi

echo '$ ./bootstrap.zsh'
./bootstrap.zsh

echo "\n$ ./npm_modules.zsh ${cmd}"
./npm_modules.zsh $cmd

echo "\n$ bower ${cmd}\n"
command -v bower && bower $cmd
command -v bower || $HOME/.npm/bin/bower $cmd

echo "\n$ bundle ${cmd}\n"
command -v bundle || gem install bundler
bundle $cmd

echo '\n$ curate -v\n'
curate -v

echo '\n$ ./update.zsh'
./update.zsh

echo '\n$ ./units.zsh'
./units.zsh

echo '\n$ ./vagrant_plugins.zsh'
./vagrant_plugins.zsh
