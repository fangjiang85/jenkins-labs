#!/bin/bash

# Check if port is already forwarded
if ! lsof -i:8080 >/dev/null 2>&1; then
  echo "[INFO] Starting Jenkins port-forward..."
  nohup kubectl port-forward svc/jenkins 8080:8080 -n jenkins > ~/.jenkins-port-forward.log 2>&1 &
else
  echo "[INFO] Port 8080 already forwarded."
fi

