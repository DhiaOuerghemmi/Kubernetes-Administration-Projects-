provider "aws" {
  region = "us-east-1"
}
module "vpc" {
  source = "../modules/vpc"
  name   = "staging-vpc"
  cidr_block = "10.1.0.0/16"                   # <- optional custom CIDR
}
module "eks-cluster" {
  source       = "../modules/eks-cluster"
  vpc_id       = module.vpc.vpc_id
  subnet_ids   = module.vpc.private_subnets
  cluster_name = "staging-cluster"
}
module "node-group" {
  source          = "../modules/node-group"
  cluster_name    = module.eks-cluster.cluster_name
  node_role_arn   = "<STAGING_NODE_ROLE_ARN>"
  subnet_ids      = module.vpc.private_subnets
  desired_capacity = 2
  max_capacity     = 4
}