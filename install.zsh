#!/usr/bin/env zsh

set -e

echo '$ ./bootstrap.zsh'
./bootstrap.zsh

echo '\n$ pip install --user --upgrade -r requirements.txt'
pip install --user --upgrade -r requirements.txt

echo '\n$ bower update\n'
bower update

echo '\n$ bundle update\n'
bundle update

echo '\n$ curate -v\n'
curate -v

echo '\n$ ./update.zsh'
./update.zsh

echo '\n$ ./units.zsh'
./units.zsh
