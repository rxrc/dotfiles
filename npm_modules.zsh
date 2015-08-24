#!/usr/bin/env zsh

set -e

npm_modules=()

command -v npm >/dev/null 2>&1 || exit 0

npm_modules+=('npm')
npm_modules+=('bower')
npm_modules+=('ember-cli')
npm_modules+=('eslint')
npm_modules+=('grunt-cli')
npm_modules+=('gulp')

for module in $npm_modules; do
  npm list -g $module || npm install -g $module
  if [[ "$1" == 'update' ]]; then
    npm update -g $module
  fi
done

exit 0
