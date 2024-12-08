#!/usr/bin/env bash

set -e
set -x

sudo cp ollama.service /etc/systemd/system/ollama.service

sudo systemctl daemon-reload
sudo systemctl start ollama

while true; do
    sleep 2
    if sudo systemctl is-active --quiet "ollama.service"; then
        break
    fi
done

sleep 5
sudo systemctl status ollama
ollama --version
