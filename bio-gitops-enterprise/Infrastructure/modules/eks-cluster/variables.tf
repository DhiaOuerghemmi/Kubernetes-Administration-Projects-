variable "region" {
  type    = string
  default = "us-east-1"
}

variable "cluster_name" {
  type        = string
  description = "Name of the EKS cluster"
  default     = "bio-cluster"
}

variable "kubernetes_version" {
  type        = string
  description = "EKS Kubernetes version"
  default     = "1.24"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for EKS"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID where EKS will be deployed"
}
