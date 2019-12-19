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

//data "aws_eks_cluster" "cluster" {
//  name = module.odc_eks_cluster_label.id
//}
//
//data "aws_eks_cluster_auth" "cluster" {
//  name = data.aws_eks_cluster.cluster.id
//}
//
//provider "kubernetes" {
//  host                   = data.aws_eks_cluster.cluster.endpoint
//  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
//  token                  = data.aws_eks_cluster_auth.cluster.token
//  load_config_file       = false
//  version                = "~> 1.10"
//}