#!/bin/bash
cluster=mycluster

is_exist=$(kubectl config get-contexts | awk '{print $3}' | grep ""$cluster")

if [ -n "$is_exist" ]; then
    echo "Cluster '${CLUSTER}' already exists!"
else
    echo "Creating cluster..."
    eksctl create cluster --name "$cluster" --region="us-west-2" --nodes-min=2 --nodes-max=3
fi
