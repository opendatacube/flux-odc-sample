module "odc_k8s_roles" {
  # source = "github.com/opendatacube/datacube-k8s-eks//odc_eks?ref=terraform-aws-odc"
  source = "../../odc_k8s_roles"

  # Cluster config
  region = "ap-southeast-2"

  owner = "odc-test"
  namespace = "odc-test"
  environment = "stage"

  cluster_autoscaler_enabled = true
}
