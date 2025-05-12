terraform {
  required_providers {
    aws  = { source = "hashicorp/aws" }
    helm = { source = "hashicorp/helm" }
  }
}

provider "aws" { region = var.region }

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.0"

  cluster_name    = var.cluster_name
  cluster_version = var.kubernetes_version

  subnets = var.subnet_ids
  vpc_id  = var.vpc_id

  manage_aws_auth = true

  tags = merge(data.aws_default_tags.default.tags, { "Name" = var.cluster_name })
}
