#!/usr/bin/env bash

set -e
set -x

sudo cp ollama.service /etc/systemd/system/ollama.service

sudo systemctl daemon-reload
sudo systemctl start ollama

echo "/tmp/ollama-run/bin/" >> $GITHUB_PATH

sleep 2
