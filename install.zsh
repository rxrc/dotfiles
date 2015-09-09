#!/usr/bin/env zsh

set -e
set -u

echo '$ ./bootstrap.zsh'
./bootstrap.zsh

echo '\n$ bower update\n'
bower update

echo '\n$ bundle update\n'
bundle update

echo '\n$ curate -v\n'
bundle exec curate -v

echo '\n$ ./update.zsh'
./update.zsh

echo '\n$ ./units.zsh'
./units.zsh

exit
