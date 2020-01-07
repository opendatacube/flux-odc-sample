variable "region" {
}

variable "certificate_arn" {
  type = string
  description = "Cretificate ARN for your domain"
}

variable "domain_name" {
  type = string
  description = "The domain name to be used by for applications deployed to the cluster and using ingress"
}

variable "cluster_name" {
  type = string
  description = "Name of your kubernetes cluster"
}
