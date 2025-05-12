variable "region" {
  type    = string
  default = "us-east-1"
}

variable "instance_ids" {
  type = list(string)
}

variable "private_ips" {
  description = "List of private IPs for SSH connection"
  type        = list(string)
}

variable "ssh_private_key_path" {
  type        = string
  description = "Path to SSH private key"
}

variable "rhsm_username" {
  type        = string
  description = "Red Hat subscription username"
}

variable "rhsm_password" {
  type        = string
  description = "Red Hat subscription password"
}
