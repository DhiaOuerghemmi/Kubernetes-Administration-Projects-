# Module: EKS Cluster

Provisions an Amazon EKS cluster using official Terraform AWS modules, ensuring AWS Well-Architected reliability and security.

## Usage
```hcl
module "eks-cluster" {
  source       = "./modules/eks-cluster"
  vpc_id       = "<VPC_ID>"  # Replace with your VPC
  subnet_ids   = ["<SUBNET_ID1>", "<SUBNET_ID2>"]
}