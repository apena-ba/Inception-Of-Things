#!/bin/bash

argocd app delete wil-playground --yes || echo "App 'wil-playground' not found or already deleted."

kubectl delete -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml || echo "Failed to delete ArgoCD resources from manifest."

kubectl delete namespace argocd || echo "Namespace 'argocd' already deleted or not found."
kubectl delete namespace dev || echo "Namespace 'dev' already deleted or not found."

k3d cluster delete dev-cluster || echo "Cluster 'dev-cluster' not found or already deleted."