output "node_group_arn" {
  description = "ARN of the node group"
  value       = aws_eks_node_group.ng.arn
}
