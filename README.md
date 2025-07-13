# Jenkins Kubernetes Deployment

This repo contains raw Kubernetes YAML manifests to deploy Jenkins into a Kubernetes cluster without Helm.

## How to Deploy

```bash
kubectl apply -f namespace.yaml
kubectl apply -f jenkins-pvc.yaml
kubectl apply -f jenkins-deployment.yaml
kubectl apply -f jenkins-service.yaml
# jenkins-labs
