#!/bin/bash

echo "[+] START"

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="server" sh -s - --flannel-backend none --token 2325456465465465

sudo chmod 777 /etc/rancher/k3s/k3s.yaml