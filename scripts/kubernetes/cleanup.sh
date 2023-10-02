#! /bin/bash
DEPLOYMENT_NAME=devoops-capstone
kubectl delete services ${DEPLOYMENT_NAME}

echo "Deleting deployment ${DEPLOYMENT_NAME}"
kubectl delete deployments ${DEPLOYMENT_NAME}
echo "deployment"
kubectl get deployments -o wide
echo "service"
kubectl get services -o wide
echo "pods"
kubectl get pods -o wide