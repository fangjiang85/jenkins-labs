#!/bin/bash

set -e

NAMESPACE="jenkins"
DATA_DIR="/home/labuser/jenkins-data"
DEPLOY_DIR="/home/labuser/lab-project/jenkins-labs/jenkins-k8s-deploy"

echo "🔄 Deleting namespace: $NAMESPACE"
kubectl delete namespace "$NAMESPACE" --ignore-not-found

echo "🧹 Deleting PersistentVolume: jenkins-pv"
kubectl delete pv jenkins-pv --ignore-not-found

echo "🧽 Cleaning Jenkins data directory: $DATA_DIR"
sudo rm -rf "$DATA_DIR"
sudo mkdir -p "$DATA_DIR"
sudo chown -R 1000:1000 "$DATA_DIR"
sudo chmod -R 755 "$DATA_DIR"

echo "📦 Recreating namespace: $NAMESPACE"
kubectl create namespace "$NAMESPACE"

echo "🚀 Applying Kubernetes YAMLs in $DEPLOY_DIR"
kubectl apply -f "$DEPLOY_DIR"

echo "✅ Jenkins redeploy complete. Use this to port-forward:"
echo "kubectl port-forward svc/jenkins 8080:8080 -n jenkins"

