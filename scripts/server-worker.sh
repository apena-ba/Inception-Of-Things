#!/bin/bash

echo "[+] WORKER SCRIPT STARTED"

K3S_TOKEN='orangechocolateeaudeparfum'

# Install k3s client mode
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --server https://192.168.56.110:6443 --token $K3S_TOKEN --node-ip=192.168.56.111" sh -s -

# Run client with token

echo "[+] WORKER SCRIPT FINISHED"
