#!/usr/bin/env zsh

set -e
set -u

node_modules=()

command -v npm >/dev/null 2>&1 || exit 0

node_modules+=('bower@^1.7.9')
node_modules+=('brunch@^2.8.2')
node_modules+=('ember-cli@^2.7.0')
node_modules+=('grunt-cli@^1.2.0')
node_modules+=('gulp-cli@^1.2.2')
node_modules+=('tern@^0.20.0')
node_modules+=('jsctags@^5.0.1')

npm install --global ${node_modules}

exit
