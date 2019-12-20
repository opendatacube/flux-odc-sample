output "cluster_autoscaler_role" {
  value = (var.cluster_autoscaler_enabled) ? aws_iam_role.autoscaler[0].arn : ""
}