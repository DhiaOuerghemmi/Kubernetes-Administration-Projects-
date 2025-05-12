provider "aws" {
  region = "us-east-1"
}
# Load modules
module "vpc" {
  source = "../modules/vpc"
  name   = "dev-vpc"
}

module "eks-cluster" {
  source          = "../modules/eks-cluster"
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = module.vpc.private_subnets
  cluster_name    = "dev-cluster"
}

module "node-group" {
  source          = "../modules/node-group"
  cluster_name    = module.eks-cluster.cluster_name
  node_role_arn   = "<DEV_NODE_ROLE_ARN>"      # <- Replace with IAM role ARN for dev nodes
  subnet_ids      = module.vpc.private_subnets
}

module "rhel-bootstrap" {
  source              = "../modules/rhel-bootstrap"
  instance_ids        = []                       # <- Add instance IDs once EKS nodes are created
  private_ips         = []                       # <- Add private IPs for SSH
  ssh_private_key_path = "~/.ssh/id_rsa"
  rhsm_username       = var.rhsm_username
  rhsm_password       = var.rhsm_password
}