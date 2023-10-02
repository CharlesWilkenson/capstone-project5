#! /bin/bash
#echo "$DOCKER_USERNAME/$DOCKER_IMAGE:$DOCKER_TAG"
kubectl create deployment udapeople-devops --image="wilkidocker2019/udapeoplecapstone" --replicas=4 && \
kubectl expose "deployment/udapeople-devops" --type="LoadBalancer" --port 80
echo "DEPLOYMENT"
kubectl get deployments -o wide
echo "SERVICES"
kubectl get services -o wide
echo "PODS"
kubectl get pods -o wide
