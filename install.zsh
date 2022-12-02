#!/usr/bin/env zsh

set -e
set -u

cmd="${1:=install}"

if [[ "$cmd" = 'config' ]]; then
  npm start
  ./units.zsh
  exit
fi

echo '$ ./bootstrap.zsh'
./bootstrap.zsh

rbenv install -s
pyenv install -s "$(cat .python-version)"
rbenv rehash
pyenv rehash
rehash

echo "\n $ npm install"
npm install

command -v bundle || gem install bundler
[[ "$cmd" = 'update' ]] && gem update bundler

echo '\n$ npm start \n'
npm start

echo '\n$ ./update.zsh'
./update.zsh

echo '\n$ ./units.zsh'
./units.zsh
./units.zsh

exit
