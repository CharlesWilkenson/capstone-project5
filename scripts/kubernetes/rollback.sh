#! /bin/bash
kubectl get deployments -o wide
kubectl rollout undo deployment "udapeople-devops 
kubectl describe pods | grep -i image
kubectl get pods -o wide
kubectl get deployments -o wide