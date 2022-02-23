#!/bin/bash

set -e
set -u

cp -as "$(pwd)/.zshenv" $HOME
cp -as "$(pwd)/.config/" $HOME

sudo apt-get update -y
sudo apt-get install -y \
  ack \
  httpie \
  ripgrep \
  silversearcher-ag

curl -L https://git.io/v5XSs | sh
ZPLUG_PROTOCOL=HTTPS zsh
