#!/usr/bin/env zsh

set -e
set -u

node_modules=()

command -v npm >/dev/null 2>&1 || exit 0

node_modules+=('babel-eslint@^6.0.4')
node_modules+=('bower@^1.7.9')
node_modules+=('brunch@^2.8.2')
node_modules+=('coffeelint@^1.15.7')
node_modules+=('ember-cli@^2.6.1')
node_modules+=('grunt-cli@^1.2.0')
node_modules+=('gulp-cli@^1.2.1')
node_modules+=('sass-lint@^1.8.0')
node_modules+=('standard@^7.1.2')
node_modules+=('standard-format@^2.2.1')

npm install --global ${node_modules}

exit
