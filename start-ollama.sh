#!/usr/bin/env bash

set -e
set -x

cp ollama.service /etc/systemd/system/ollama.service

systemctl daemon-reload
systemctl start ollama

sleep 2
