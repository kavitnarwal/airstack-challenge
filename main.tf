terraform {
    backend "s3" {}
}

module "eks" {
    source                             = "./eks"

    project_environment                = var.project_environment

    eks_cluster_name                   = var.eks_cluster_name
    eks_cluster_version                = var.eks_cluster_version

    # Networking 
    vpc_id                             = var.vpc_id
    subnet_ids                         = var.public_subnet_ids

    # Instance
    instance_type                      = var.instance_type
    capacity_type                      = var.capacity_type
    key_name                           = var.key_name
    min_size                           = var.min_size
    max_size                           = var.max_size
    desired_size                       = var.desired_size
}


# terraform init -backend-config="bucket=crofarm-terraform" -backend-config="key=nonprod/eks/terraform.tfstate" -backend-config="region=ap-south-1" -backend=true -input=false
