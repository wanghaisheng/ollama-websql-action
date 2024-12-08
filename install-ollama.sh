#!/usr/bin/env bash

set -e
set -x

# from https://github.com/ollama/ollama/blob/v0.5.1/scripts/install.sh#L32-L37
ARCH=$(uname -m)
case "$ARCH" in
    x86_64) ARCH="amd64" ;;
    aarch64|arm64) ARCH="arm64" ;;
    *) error "Unsupported architecture: $ARCH" ;;
esac

mkdir -p ollama-run
curl -L https://ollama.com/download/ollama-linux-${ARCH}.tgz -o ollama.tgz
tar -C ollama-run -xzf ollama.tgz
