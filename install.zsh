#!/usr/bin/env zsh

set -e

echo '$ ./bootstrap.zsh'
./bootstrap.zsh

echo '\n$ pip install --user --upgrade -r requirements.txt'
pip install --user --upgrade -r requirements.txt

cp dotfiles/npmrc $HOME/.npmrc
echo '\n$ ./npm_modules.zsh'
./npm_modules.zsh

echo '\n$ bower update\n'
$HOME/.npm/bin/bower update

echo '\n$ bundle update\n'
bundle update

echo '\n$ curate -v\n'
curate -v

echo '\n$ ./update.zsh'
./update.zsh

echo '\n$ ./units.zsh'
./units.zsh

echo '\n$ ./vagrant_plugins.zsh'
./vagrant_plugins.zsh
