variable "project_environment" {}

# EKS Details

variable "eks_cluster_name" {}
variable "eks_cluster_version" {}
variable "vpc_id" {}
variable "subnet_ids" {}

# Instance Details

variable "instance_type" {}
variable "capacity_type" {}
variable "key_name" {}
variable "max_size" {}
variable "min_size" {}
variable "desired_size" {}