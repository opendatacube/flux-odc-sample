provider "aws" {
  region      = var.region
  max_retries = 10
}

module "odc_eks_cluster_label" {
  source     = "git::https://github.com/cloudposse/terraform-terraform-label.git?ref=tags/0.4.0"
  namespace  = var.namespace
  stage      = var.environment
  name       = "odc-eks"
  delimiter  = "-"
}

data "aws_caller_identity" "current" {
}