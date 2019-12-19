terraform {
  backend "s3" {
    bucket = "odc-test-stage-backend-tfstate"
    key    = "odc_roles_terraform.tfstate"
    region = "ap-southeast-2"
  }
}