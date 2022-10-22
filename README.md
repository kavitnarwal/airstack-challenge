# airstack-challenge



## Getting started

First of all create EKS cluster. Below are the steps for EKS cluster creation. 

1. Change the variable value into terraform.tfvars file. Like vpc_id, public_subnet_ids, eks_cluster_version, eks_cluster_name, etc. 

2. Now run terraform init command. It will ask some variable values like S3 bucket, AWS region etc. Pass all variable values. 

3. Run terraform plan command. To check the resources details which will be affected. 

4. Run terraform apply. To apply all the changes. 

# Access EKS cluster. 

1. Download the kube config file. #aws eks update-kubeconfig --region region-code --name my-cluster
2. Configure IAM user into your machine. # aws configure
3. Check if we are able to access EKS cluster from the machine. # kubectl get po -n kube-system

# Make docker image of test-app 

1. Clone test app into your machine. 
2. Make a docker image using the shared Dockerfile. # docker build -t test-app .
3. Tag the docker image. # docker tag test-app:latest 378689032750.dkr.ecr.ap-south-1.amazonaws.com/test-app:2
4. Push docker image to ECR repository. # docker push 378689032750.dkr.ecr.ap-south-1.amazonaws.com/test-app:2

# Deploy docker image on EKS cluster. 

1. Create dev namespace. # kubectl create ns dev
2. Run kubectl apply -f . # To apply all the yaml files. These file will create deployment, Service and ingress for dev environment. 
3. Same steps we will follow for qa environment as well. 

