#!/bin/bash
set -eux -o pipefail

if [[ $TARGETPLATFORM =~ "amd64" ]]
then
  # NOTE: keep the version synced with https://storage.googleapis.com/kubernetes-release/release/stable.txt
  [ -e $DOWNLOADS/kubectl ] || curl -sLf --retry 3 -o $DOWNLOADS/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.14.0/bin/linux/amd64/kubectl
  cp $DOWNLOADS/kubectl $BIN/
  chmod +x $BIN/kubectl
fi

if [[ $TARGETPLATFORM =~ "arm64" ]]
then
  # NOTE: keep the version synced with https://storage.googleapis.com/kubernetes-release/release/stable.txt
  [ -e $DOWNLOADS/kubectl ] || curl -sLf --retry 3 -o $DOWNLOADS/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.14.0/bin/linux/arm64/kubectl
  cp $DOWNLOADS/kubectl $BIN/
  chmod +x $BIN/kubectl
fi
