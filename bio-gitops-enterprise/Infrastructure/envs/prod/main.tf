provider "aws" {
  region = "us-east-1"
}
module "vpc" {
  source = "../modules/vpc"
  name   = "prod-vpc"
  cidr_block = "10.2.0.0/16"                   # <- production CIDR
}
module "eks-cluster" {
  source       = "../modules/eks-cluster"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnets
  cluster_name = "prod-cluster"
}
module "node-group" {
  source          = "../modules/node-group"
  cluster_name    = module.eks-cluster.cluster_name
  node_role_arn   = "<PROD_NODE_ROLE_ARN>"
  subnet_ids      = module.vpc.private_subnets
  desired_capacity = 3
  max_capacity     = 6
}