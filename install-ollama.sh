#!/usr/bin/env bash

set -e
set -x

curl -L https://ollama.com/download/ollama-linux-amd64.tgz -o ollama-linux-amd64.tgz
mkdir /ollama-run
tar -C /ollama-run -xzf ollama-linux-amd64.tgz

/ollama-run/bin/ollama --version
