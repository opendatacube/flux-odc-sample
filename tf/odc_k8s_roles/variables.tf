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

variable "cluster_autoscaler_enabled" {
  default = false
}