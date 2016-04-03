#!/usr/bin/env zsh

set -e
set -u

node_modules=()

command -v npm >/dev/null 2>&1 || exit 0

node_modules+=('babel-eslint@^6.0.2')
node_modules+=('bower@^1.6.4')
node_modules+=('brunch@^2.2.3')
node_modules+=('coffeelint@^1.14.2')
node_modules+=('ember-cli@^2.3.0')
node_modules+=('grunt-cli@^1.2.0')
node_modules+=('gulp@^3.9.0')
node_modules+=('sass-lint@^1.5.1')
node_modules+=('standard@^6.0.4')
node_modules+=('standard-format@^2.1.0')

npm install --global ${node_modules}

exit
