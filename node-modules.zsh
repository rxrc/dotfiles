#!/usr/bin/env zsh

set -e
set -u

node_modules=()

command -v npm >/dev/null 2>&1 || exit 0

npm config set sign-git-tag true

node_modules+=('gh-home@^2.0.1')
node_modules+=('jsctags@^5.0.1')
node_modules+=('json-diff@^0.5.2')
node_modules+=('tern@^0.24.0')

npm install --global ${node_modules}

exit
