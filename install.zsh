#!/usr/bin/env zsh

./bootstrap.zsh && \
bower update    && \
bundle update   && \
curate -v       && \
./update.zsh
