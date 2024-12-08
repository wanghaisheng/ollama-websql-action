#!/usr/bin/env bash

set -e
set -x

ollama --version

sudo cp ollama.service /etc/systemd/system/ollama.service

sudo systemctl daemon-reload
sudo systemctl start ollama

while true; do
    sleep 2
    if sudo systemctl is-active --quiet "ollama.service"; then
        echo "ollama.service is active "
        break
    else
        echo "ollama.service not active yet, waiting 2 seconds..."
    fi
done

sudo systemctl status ollama
