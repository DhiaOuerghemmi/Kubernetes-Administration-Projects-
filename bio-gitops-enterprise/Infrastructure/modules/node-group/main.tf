terraform {
  required_providers { aws = { source = "hashicorp/aws" } }
}

provider "aws" { region = var.region }

resource "aws_eks_node_group" "ng" {
  cluster_name    = var.cluster_name
  node_group_name = var.node_group_name
  node_role_arn   = var.node_role_arn

  subnet_ids      = var.subnet_ids

  scaling_config {
    desired_size = var.desired_capacity
    max_size     = var.max_capacity
    min_size     = var.min_capacity
  }

  labels = var.labels

  tags = merge(data.aws_default_tags.default.tags, { "Name" = var.node_group_name })
}