variable "region" {
  type    = string
  default = "us-east-1"
}

variable "cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "node_group_name" {
  type    = string
  default = "bio-node-group"
}

variable "node_role_arn" {
  type        = string
  description = "IAM role ARN for nodes"
}

variable "subnet_ids" {
  type = list(string)
}

variable "desired_capacity" {
  type    = number
  default = 2
}

variable "min_capacity" {
  type    = number
  default = 1
}

variable "max_capacity" {
  type    = number
  default = 3
}

variable "labels" {
  type    = map(string)
  default = { "role" = "worker" }
}
