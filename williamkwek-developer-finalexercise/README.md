This is a Terraform and Kubenetes exercise for Akamai ASEAN Developer training 

![image](https://github.com/akamai-devops-APJ/williamkwek-developer-finalexercise/assets/92004085/25c58e3d-b019-4faf-b4b0-fa058579d5d6)


![image](https://github.com/akamai-devops-APJ/williamkwek-developer-finalexercise/assets/92004085/89682183-bbd1-40cc-a14c-ed4f3c72f82f)


Here are my steps to deploy my demo app on Linode.

Step 1. Provision Kubernetes Cluster with 3 nodes on Linode via Terraform 
   terraform apply

Step 2. Deploy Rancher application & Ingress Nginx on Kubernetes cluster, Update DNS record in EdgeDNS via Terraform and Provision TLS certificate on Kubernetes (Ingress Nginx) by running the "install_app.sh" script

  ./install_app.sh
