provider "aws" {
  region      = var.region
  max_retries = 10
}

data "aws_caller_identity" "current" {
}