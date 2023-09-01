This is a Terraform and Kubenetes exercise for Akamai ASEAN Developer training 

![image](https://github.com/akamai-devops-APJ/Examples/assets/92004085/2799dbe2-5d98-401c-91bb-1d5761df6484)

![image](https://github.com/akamai-devops-APJ/Examples/assets/92004085/3a6e905c-936b-4873-8954-bdd26f947c2b)

Here are my steps to deploy my demo app on Linode.

Step 1. Provision Kubernetes Cluster with 3 nodes on Linode via Terraform 
   terraform apply

Step 2. Deploy Rancher application & Ingress Nginx on Kubernetes cluster, Update DNS record in EdgeDNS via Terraform and Provision TLS certificate on Kubernetes (Ingress Nginx) by running the "install_app.sh" script

  ./install_app.sh
