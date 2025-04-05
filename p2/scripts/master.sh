#!/bin/bash

# SETUP

export REPLICAS_NUMBER=''
export APP_NAME=''

function apply-config(){
    envsubst < /vagrant/configs/app-template.yaml | kubectl apply -f -
}

# MAIN SCRIPT

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --node-ip 192.168.56.110" sh -s -

#cp /var/lib/rancher/k3s/server/node-token /vagrant/.

REPLICAS_NUMBER=1; APP_NAME='app-one'; apply-config
REPLICAS_NUMBER=3; APP_NAME='app-two'; apply-config
REPLICAS_NUMBER=1; APP_NAME='app-three'; apply-config
sleep 30