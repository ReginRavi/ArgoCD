#!/bin/bash

# Wait for Docker to be ready
echo "Waiting for Docker to start..."
timeout=60
while ! docker info > /dev/null 2>&1; do
  if [ $timeout -le 0 ]; then
    echo "Error: Docker did not start in time. Please start Docker Desktop manually."
    exit 1
  fi
  echo -n "."
  sleep 2
  ((timeout-=2))
done
echo "Docker is running!"

# Install kind if not installed
if ! command -v kind &> /dev/null; then
  echo "Installing kind..."
  brew install kind
fi

# Create cluster if it doesn't exist
if ! kind get clusters | grep -q "kind"; then
  echo "Creating Kubernetes cluster with kind..."
  kind create cluster --name kind
else
  echo "Cluster 'kind' already exists."
fi

# Export kubeconfig (kind does this automatically, but good to ensure)
kubectl cluster-info --context kind-kind

echo "Cluster is ready!"
