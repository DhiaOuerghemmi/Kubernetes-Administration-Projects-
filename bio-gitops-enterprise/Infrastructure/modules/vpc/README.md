# Module: VPC

This module provisions a VPC with public and private subnets in multiple AZs, following AWS Well-Architected best practices for network design.

## Usage
```hcl
module "vpc" {
  source = "./modules/vpc"
  name   = "my-bio-cluster-vpc"
}