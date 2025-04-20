#!/bin/bash

k3d cluster create argocluster --agents 2 # Port forward

kubectl create namespace argocd
kubectl create namespace dev

kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

#kubectl port-forward svc/argocd-server -n argocd 8080:443 &

argocd login localhost:8080 --username admin --password $(sudo kubectl get secret argocd-initial-admin-secret -n argocd -o jsonpath="{.data.password}" | base64 -d)

git clone https://github.com/apena-ba/Inception-Of-Things.git
cd Inception-Of-Things

argocd app create wil-playground --repo https://github.com/apena-ba/Inception-Of-Things.git --path ./p3/confs --dest-server https://kubernetes.default.svc --dest-namespace dev

argocd app set --sync-policy auto wil-playground
