#!/bin/bash
set -eux -o pipefail

if [[ $TARGETPLATFORM =~ "amd64" ]]
then
  [ -e $DOWNLOADS/ks.tar.gz ] || curl -sLf --retry 3 -o $DOWNLOADS/ks.tar.gz https://github.com/ksonnet/ksonnet/releases/download/v0.13.1/ks_0.13.1_linux_amd64.tar.gz
  tar -C /tmp -xf $DOWNLOADS/ks.tar.gz
  cp /tmp/ks_0.13.1_linux_amd64/ks $BIN/ks
  chmod +x $BIN/ks
  ks version
fi

if [[ $TARGETPLATFORM =~ "arm64" ]]
then
  #KSONNET_VERSION=0.13.1
  #go get github.com/ksonnet/ksonnet; exit 0
  #cd $GOPATH/src/github.com/ksonnet/ksonnet
  #git checkout v$KSONNET_VERSION
  #GOARCH=arm64 make install
  #make install
  #mv $GOPATH/bin/ks /usr/local/bin/ks
  #cd /tmp
  [ -e $DOWNLOADS/ks.tar.gz ] || curl -sLf --retry 3 -o $DOWNLOADS/ks.tar.gz https://github.com/ksonnet/ksonnet/releases/download/v0.13.1/ks_0.13.1_linux_amd64.tar.gz
  tar -C /tmp -xf $DOWNLOADS/ks.tar.gz
  cp /tmp/ks_0.13.1_linux_amd64/ks $BIN/ks
  chmod +x $BIN/ks
fi
