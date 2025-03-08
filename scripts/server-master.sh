#!/bin/bash

echo "[+] SERVER SCRIPT STARTED"

K3S_TOKEN='orangechocolateeaudeparfum'

# Install k3s server mode
#curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server" sh -s - --token $K3S_TOKEN --flannel-backend none
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --node-ip 192.168.56.110 --token $K3S_TOKEN" sh -s -

#sleep 15

echo "[+] SERVER SCRIPT FINISHED"
