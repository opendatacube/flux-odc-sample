variable "region" {
}

variable "owner" {
}

variable "namespace" {
  description = "Namespace for your deployment"
}

variable "environment" {
  description = "Name of your environment e.g. dev, stage, prod"
}

variable "domain_name" {
  description = "The domain name to be used by for applications deployed to the cluster and using ingress"
  default = ""
}

variable "cluster_autoscaler_enabled" {
  default = false
}

variable "alb_ingress_enabled" {
  default = false
}