#!/bin/bash
set -eux -o pipefail

if [[ $TARGETPLATFORM =~ "amd64" ]]
then
  [ -e $DOWNLOADS/helm.tar.gz ] || curl -sLf --retry 3 -o $DOWNLOADS/helm.tar.gz https://storage.googleapis.com/kubernetes-helm/helm-v2.15.2-linux-amd64.tar.gz
  tar -C /tmp/ -xf $DOWNLOADS/helm.tar.gz
  cp /tmp/linux-amd64/helm $BIN/helm
  helm version --client
fi

if [[ $TARGETPLATFORM =~ "arm64" ]]
then
  [ -e $DOWNLOADS/helm.tar.gz ] || curl -sLf --retry 3 -o $DOWNLOADS/helm.tar.gz https://get.helm.sh/helm-v2.15.2-linux-arm64.tar.gz
  tar -C /tmp/ -xf $DOWNLOADS/helm.tar.gz
  cp /tmp/linux-arm64/helm $BIN/helm
  helm version --client
fi
