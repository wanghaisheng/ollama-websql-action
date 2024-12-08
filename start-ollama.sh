#!/usr/bin/env bash

set -e
set -x

ollama --version

sudo cp ollama.service /etc/systemd/system/ollama.service

sudo systemctl daemon-reload
sudo systemctl start ollama

sleep 2
