#!/usr/bin/env zsh

set -e
set -u

node_modules=()

command -v npm >/dev/null 2>&1 || exit 0

node_modules+=('bower@^1.6.4')
node_modules+=('ember-cli@^1.13.12')
node_modules+=('grunt-cli@^0.1.13')
node_modules+=('gulp@^3.9.0')
node_modules+=('standard@^5.3.1')

npm install --global ${node_modules}

exit
