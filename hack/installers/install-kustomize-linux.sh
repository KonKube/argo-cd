#!/bin/bash
set -eux -o pipefail

if [[ $TARGETPLATFORM =~ "amd64" ]]
then
  KUSTOMIZE_VERSION=${KUSTOMIZE_VERSION:-3.2.1}
  DL=$DOWNLOADS/kustomize-${KUSTOMIZE_VERSION}

  # Note that kustomize release URIs have changed for v3.2.1. Then again for
  # v3.3.0. When upgrading to versions >= v3.3.0 please change the URI format. And
  # also note that as of version v3.3.0, assets are in .tar.gz form.
  # v3.2.0 = https://github.com/kubernetes-sigs/kustomize/releases/download/v3.2.0/kustomize_3.2.0_linux_amd64
  # v3.2.1 = https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v3.2.1/kustomize_kustomize.v3.2.1_linux_amd64
  # v3.3.0 = https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v3.3.0/kustomize_v3.3.0_linux_amd64.tar.gz
  case $KUSTOMIZE_VERSION in
    2.*)
      URL=https://github.com/kubernetes-sigs/kustomize/releases/download/v${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64
      ;;
    *)
      URL=https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v${KUSTOMIZE_VERSION}/kustomize_kustomize.v${KUSTOMIZE_VERSION}_linux_amd64
      ;;
  esac

  [ -e $DL ] || curl -sLf --retry 3 -o $DL $URL
  cp $DL $BIN/kustomize
  chmod +x $BIN/kustomize
  kustomize version
fi

if [[ $TARGETPLATFORM =~ "arm64" ]]
then
  ##KUSTOMIZE_VERSION=3.2.1
  ##GOARCH=arm64
  ##GO111MODULE=on go get sigs.k8s.io/kustomize/kustomize/v3@v$KUSTOMIZE_VERSION
  ##mv $GOPATH/bin/kustomize /usr/local/bin/kustomize

  ##go get github.com/kubernetes-sigs/kustomize
  ##cd $GOPATH/src/github.com/kubernetes-sigs/kustomize
  ##git reset --hard
  ##git checkout kustomize/v3.2.1
  ##GOARCH=arm64 go build -o kustomize cmd/kustomize/main.go
  ##chmod +x kustomize
  ##mv kustomize /usr/local/bin/kustomize

  KUSTOMIZE_VERSION=${KUSTOMIZE_VERSION:-3.2.1}
  DL=$DOWNLOADS/kustomize-${KUSTOMIZE_VERSION}

  # Note that kustomize release URIs have changed for v3.2.1. Then again for
  # v3.3.0. When upgrading to versions >= v3.3.0 please change the URI format. And
  # also note that as of version v3.3.0, assets are in .tar.gz form.
  # v3.2.0 = https://github.com/kubernetes-sigs/kustomize/releases/download/v3.2.0/kustomize_3.2.0_linux_amd64
  # v3.2.1 = https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v3.2.1/kustomize_kustomize.v3.2.1_linux_amd64
  # v3.3.0 = https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v3.3.0/kustomize_v3.3.0_linux_amd64.tar.gz
  case $KUSTOMIZE_VERSION in
    2.*)
      URL=https://github.com/kubernetes-sigs/kustomize/releases/download/v${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64
      ;;
    *)
      URL=https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/v${KUSTOMIZE_VERSION}/kustomize_kustomize.v${KUSTOMIZE_VERSION}_linux_amd64
      ;;
  esac

  [ -e $DL ] || curl -sLf --retry 3 -o $DL $URL
  cp $DL $BIN/kustomize
  chmod +x $BIN/kustomize
  kustomize version
fi
