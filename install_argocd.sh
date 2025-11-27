#!/bin/bash

# Create namespace
kubectl create namespace argocd

# Install Argo CD
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Wait for pods to be ready
echo "Waiting for Argo CD components to be ready..."
kubectl wait --for=condition=available --timeout=600s deployment/argocd-server -n argocd

# Port forward
echo "Argo CD is ready. You can access it by port-forwarding:"
echo "kubectl port-forward svc/argocd-server -n argocd 8080:443"
echo "Username: admin"
echo "Password can be retrieved with:"
echo "kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath=\"{.data.password}\" | base64 -d; echo"
