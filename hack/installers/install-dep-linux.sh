#!/bin/bash
set -eux -o pipefail

if [[ $TARGETPLATFORM =~ "amd64" ]]
then
  [ -e $DOWNLOADS/dep ] || curl -sLf --retry 3 -o $DOWNLOADS/dep https://github.com/golang/dep/releases/download/v0.5.3/dep-linux-amd64
  cp $DOWNLOADS/dep $BIN/
  chmod +x $BIN/dep
  dep version
fi

if [[ $TARGETPLATFORM =~ "arm64" ]]
then
  [ -e $DOWNLOADS/dep ] || curl -sLf --retry 3 -o $DOWNLOADS/dep https://github.com/golang/dep/releases/download/v0.5.3/dep-linux-arm64
  cp $DOWNLOADS/dep $BIN/
  chmod +x $BIN/dep
  dep version
fi
