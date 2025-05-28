#!/bin/bash

# Setup

export REPLICAS_NUMBER=''
export APP_NAME=''

function apply-config(){
    envsubst < /vagrant/confs/app-template.yaml | kubectl apply -f -
}

# Main script

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --node-ip 192.168.56.110" sh -s -

REPLICAS_NUMBER=1; APP_NAME='app-one'; apply-config
REPLICAS_NUMBER=3; APP_NAME='app-two'; apply-config
REPLICAS_NUMBER=1; APP_NAME='app-three'; apply-config

kubectl apply -f /vagrant/confs/ingress.yaml

sleep 45