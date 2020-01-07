data "template_file" "cluster_autoscaler" {
  template = "${file("${path.module}/config/cluster_autoscaler.yaml")}"
  vars = {
    cluster_name = "${var.cluster_name}"
    region = "${var.region}"
  }
}

resource "kubernetes_secret" "cluster_autoscaler" {
  depends_on = [
    kubernetes_namespace.admin
  ]

  metadata {
    name = "cluster-autoscaler"
    namespace = "admin"
  }

  data = {
    "values.yaml" = "${data.template_file.cluster_autoscaler.rendered}"
  }

  type = "Opaque"
}