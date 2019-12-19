variable "region" {
  default = "ap-southeast-2"
}

variable "namespace" {
  description = "Namespace for your deployment"
  default = "odc-test"
}

variable "environment" {
  description = "Name of your environment e.g. dev, stage, prod"
  default = "stage"
}

variable "cluster_autoscaler_enabled" {
  default = true
}