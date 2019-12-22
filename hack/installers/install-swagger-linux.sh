#!/bin/bash
set -eux -o pipefail

if [[ $TARGETPLATFORM =~ "amd64" ]]
then
  [ -e $DOWNLOADS/swagger ] || curl -sLf --retry 3 -o $DOWNLOADS/swagger https://github.com/go-swagger/go-swagger/releases/download/v0.19.0/swagger_linux_amd64
  cp $DOWNLOADS/swagger $BIN/swagger
  chmod +x $BIN/swagger
  swagger version
fi

if [[ $TARGETPLATFORM =~ "arm64" ]]
then
  [ -e $DOWNLOADS/swagger ] || curl -sLf --retry 3 -o $DOWNLOADS/swagger https://github.com/go-swagger/go-swagger/releases/download/v0.19.0/swagger_linux_arm64
  cp $DOWNLOADS/swagger $BIN/swagger
  chmod +x $BIN/swagger
  swagger version
fi
