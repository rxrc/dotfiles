#!/usr/bin/env zsh

echo '$ ./bootstrap.zsh'
./bootstrap.zsh && \
  echo '\n$ bower update\n'  && \
  bower update  && \
  echo '\n$ bundle update\n' && \
  bundle update && \
  echo '\n$ curate -v\n'     && \
  curate -v     && \
  echo '\n$ ./update.zsh'  && \
  ./update.zsh
