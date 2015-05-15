#!/usr/bin/env zsh

set -e

vagrant_plugins=()

command -v vagrant >/dev/null 2>&1 || exit 0

vagrant_plugins+=('vagrant-berkshelf')
vagrant_plugins+=('vagrant-cachier')
vagrant_plugins+=('vagrant-ohai')
vagrant_plugins+=('vagrant-omnibus')

for plugin in $vagrant_plugins; do
  vagrant plugin list | grep "^${plugin} (.*)$" \
    || vagrant plugin install $plugin
done

exit 0
