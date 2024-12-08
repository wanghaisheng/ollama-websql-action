#!/usr/bin/env bash

set -e
set -x

ARCH=$(uname -m)
curl -L https://ollama.com/download/ollama-linux-${ARCH}.tgz -o ollama.tgz
mkdir /tmp/ollama-run
tar -C /tmp/ollama-run -xzf ollama.tgz

/tmp/ollama-run/bin/ollama --version
