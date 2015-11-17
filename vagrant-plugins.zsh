#!/usr/bin/env zsh

set -e

plugins=()

command -v vagrant >/dev/null 2>&1 || exit 0

plugins+=('vagrant-berkshelf')
plugins+=('vagrant-cachier')
plugins+=('vagrant-ohai')
plugins+=('vagrant-omnibus')

for plugin in $plugins; do
  vagrant plugin list | grep "^${plugin} (.*)$" \
    || vagrant plugin install $plugin
done

exit 0
