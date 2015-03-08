#!/usr/bin/env zsh

./bootstrap.zsh && \
bower update    && \
bundle update   && \
curate          && \
./update.zsh
