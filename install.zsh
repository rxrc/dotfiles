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

echo "\n $ npm install"
npm install

echo '\n$ npm start \n'
npm start

echo '\n$ ./update.zsh'
./update.zsh

echo '\n$ ./units.zsh'
./units.zsh
./units.zsh

exit
