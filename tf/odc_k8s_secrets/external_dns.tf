data "aws_route53_zone" "domain" {
  name         = "${var.domain_name}"
}

data "template_file" "external_dns" {
  template = "${file("${path.module}/config/external_dns.yaml")}"
  vars = {
    cluster_name = "${var.cluster_name}"
    hosted_zone_id = "${data.aws_route53_zone.domain.zone_id}"
    domain_name = "${var.domain_name}"
  }
}

resource "kubernetes_secret" "external_dns" {
  depends_on = [
    kubernetes_namespace.admin
  ]

  metadata {
    name = "external-dns"
    namespace = "admin"
  }

  data = {
    "values.yaml" = "${data.template_file.external_dns.rendered}"
  }

  type = "Opaque"
}