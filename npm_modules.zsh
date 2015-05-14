#!/usr/bin/env zsh

set -e

npm_modules=()

command -v npm >/dev/null 2>&1 || exit 0

npm_modules+=('bower')
npm_modules+=('grunt-cli')
npm_modules+=('gulp')

for module in $npm_modules; do
  npm install -g $module
  npm update -g $module
done

exit 0
