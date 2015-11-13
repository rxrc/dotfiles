#!/usr/bin/env zsh

set -e
set -u

npm_modules=()

command -v npm >/dev/null 2>&1 || exit 0

npm_modules+=('bower@^1.6.4')
npm_modules+=('ember-cli@1.13.12')
npm_modules+=('eslint_d@^2.3.1')

for module in $npm_modules; do
  npm install --global ${module}
done

exit
