project_environment     = "nonprod"

vpc_id                  = "vpc-0421c03fb30b00746"
public_subnet_ids     = ["subnet-0812c39b4b99a3161", "subnet-0f91710425ffa41a9", "subnet-07a032187a97433f8"]

eks_cluster_version     = "1.23"
eks_cluster_name        = "airstack-challenge"
instance_type           = ["t3.micro","t3a.micro"]
capacity_type           = "ON_DEMAND"
key_name                = "test-pem"
min_size                = 1
desired_size            = 1
max_size                = 1
