output "autoscaler_role" {
  value = aws_iam_role.autoscaler[0].arn
}