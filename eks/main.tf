module "eks" {
    source                                = "terraform-aws-modules/eks/aws"
    cluster_version                       = var.eks_cluster_version
    cluster_name                          = "${var.eks_cluster_name}-${var.project_environment}"

    vpc_id                                = var.vpc_id
    subnet_ids                            = var.subnet_ids
    cluster_endpoint_private_access       = true
    cluster_endpoint_public_access        = false
    cluster_enabled_log_types             = []

    eks_managed_node_groups               = { 
                                                Node = {  
                                                    name                  = "${var.eks_cluster_name}-${var.project_environment}-ng"
                                                    use_name_prefix       = false
                                                    launch_template_name  = "${var.eks_cluster_name}-${var.project_environment}"
                                                    instance_types        = var.instance_type
                                                    capacity_type         = var.capacity_type
                                                    key_name              = var.key_name

                                                    # AutoScaling
                                                    max_size              = var.max_size
                                                    desired_size          = var.desired_size
                                                    min_size              = var.min_size

                                                    ebs_optimized           = true

                                                    block_device_mappings = {
                                                        xvda = {
                                                            device_name = "/dev/xvda"
                                                            ebs = {
                                                                volume_size           = 20
                                                                volume_type           = "gp3"
                                                                iops                  = 3000
                                                                throughput            = 150
                                                                encrypted             = true
                                                                delete_on_termination = true
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                            
                                        

    tags  = {
        Cluster = var.eks_cluster_name
        Environment = var.project_environment
        key = "kubernetes.io/cluster/${var.eks_cluster_name}-${var.project_environment}"
        value = "owned"
        propagate_at_launch = true
    }
}
