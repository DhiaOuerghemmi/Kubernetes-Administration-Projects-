# Module: EKS Node Group

Creates an EKS managed node group to attach to an EKS cluster, following AWS performance and reliability best practices.

## Usage

```hcl
module "node-group" {
  source          = "./modules/node-group"
  cluster_name    = module.eks-cluster.cluster_name
  node_role_arn   = "<NODE_ROLE_ARN>"
  subnet_ids      = module.vpc.private_subnets
}
```
