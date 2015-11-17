#!/usr/bin/env zsh

set -e
set -u

modules=()

command -v npm >/dev/null 2>&1 || exit 0

modules+=('bower@^1.6.4')
modules+=('ember-cli@^1.13.12')
modules+=('standard@^5.3.1')

for module in $modules; do
  npm install --global ${module}
done

exit
