#!/usr/bin/env bash

set -e
set -x

curl -L https://ollama.com/download/ollama-linux-amd64.tgz -o ollama-linux-amd64.tgz
mkdir /tmp/ollama-run
tar -C /tmp/ollama-run -xzf ollama-linux-amd64.tgz

/tmp/ollama-run/bin/ollama --version
