#!/bin/bash

export KUBECONFIG=.kube/kubeconfig.yaml

## Deploy rancher app
kubectl create -f rancher-demo.yaml

## Deploy ingress-nginx on Kubernetes cluster
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm install ingress-nginx ingress-nginx/ingress-nginx

## Create ingress service
kubectl create -f my-new-ingress.yaml

## Get external IP address of load balancer
#kubectl --namespace default get services -o wide -w ingress-nginx-controller

INGRESS_IP=`kubectl describe svc | grep "LoadBalancer Ingress:" | awk '{print $3}'`

echo "Ingress IP = ${INGRESS_IP}"

read -p "Please ENTER to continue"

## Update DNS with new IP
cd edgedns
export TF_VAR_demo_egress_ip=[\"$INGRESS_IP\"]
terraform apply
#terraform apply -var="demo_egress_ip=[${INGRESS_IP}]"

## Check if the new IP is effect on DNS
NEW_IP=`dig demo.yinpok.com +short`
echo "NEW_IP = $NEW_IP"
while [[ $NEW_IP != $INGRESS_IP ]]
do 
    NEW_IP=`dig demo.yinpok.com +short`
    echo "NEW_IP = $NEW_IP"
    sleep 5
done
cd ..

## cert manager
## creating cert manager/cert bot service

echo "Creating cert manager/bot service..."

kubectl apply -f https://github.com/cert-manager/cert-manager/releases/download/v1.11.0/cert-manager.yaml
sleep 5

## creating cluster issuer service
echo "Creating cluster issuer service..."
echo ""
kubectl apply -f cluster-issuer-production.yaml
sleep 5

kubectl get clusterissuer

read -p "Please ENTER to continue"

## creating certificate in production

echo "Creating certificate in production..."
echo ""
kubectl apply -f certificate-production.yaml
sleep 5

read -p "Please ENTER to continue"



## check certificate status, need to wait few minutes after adding DNS record

echo "Checking the status of certificate is ready or not..."
echo ""

while [[ $CERT_STATUS != "True" ]]
do 
    CERT_STATUS=`kubectl get certificates | grep "True" | awk '{print $2}'`
    echo $CERT_STATUS
    sleep 10
done

echo "The certificate is ready"
echo "Installation is completed."
read -p "Please ENTER to continue"

