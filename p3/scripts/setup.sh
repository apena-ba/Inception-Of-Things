#!/bin/bash

# Colors

red=$'\033[0;31m'
yellow=$'\033[0;33m'
green=$'\033[0;32m'
reset=$'\033[0;39m'

# Argo-cd setup

echo -e "\n$green[+]$reset Cluster setup started\n"

k3d cluster create dev-cluster -c ../confs/k3d.yaml
kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'

timeout=180
elapsed=0
while true; do
    if [[ $(curl 'https://localhost:8080' -k -s -o /dev/null -w "%{http_code}") == 200 ]]; then
        echo -e "\n\n$green[+]$reset Argo CD is up"
        break
    else
        echo -e "\n$yellow[=]$reset Waiting for ArgoCD"
        sleep 10
        ((elapsed+=10))
        if ((elapsed >= timeout)); then
            echo -e "\n$red[-]$reset Timeout reached while waiting for Argo CD"
            exit 1
        fi
    fi
done

# Will app setup

echo -e "\n$yellow[=]$reset App deployment in progress"

argocd login localhost:8080 --insecure --username admin --password $(sudo kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d)

git clone https://github.com/apena-ba/Inception-Of-Things.git
cd Inception-Of-Things

kubectl create namespace dev
argocd app create wil-playground --repo https://github.com/apena-ba/Inception-Of-Things.git --path ./p3/confs --dest-server https://kubernetes.default.svc --dest-namespace dev

argocd app set --sync-policy auto wil-playground

echo -e "\n$green[+]$reset Cluster setup finished"