data "template_file" "prometheus" {
  template = "${file("${path.module}/config/prometheus.yaml")}"
  vars = {
    certificate_arn = "${var.certificate_arn}"
    domain_name = "${var.domain_name}"
  }
}

resource "kubernetes_secret" "prometheus" {
  depends_on = [
    kubernetes_namespace.admin
  ]

  metadata {
    name = "prometheus"
    namespace = "admin"
  }

  data = {
    "values.yaml" = "${data.template_file.prometheus.rendered}"
  }

  type = "Opaque"
}