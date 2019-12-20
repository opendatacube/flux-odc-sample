resource "kubernetes_namespace" "admin" {
  metadata {
    name = "admin"

    labels = {
      managed-by = "Terraform"
    }
  }
}

resource "kubernetes_secret" "role_config_secrets" {
  depends_on = [
    kubernetes_namespace.admin
  ]

  metadata {
    name = "role-config-secrets"
    namespace = "admin"
  }

  data = {
    base-role-arn = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/"
    cluster_autoscaler_role_arn = var.admin_secrets.cluster_autoscaler_role
  }

  type = "kubernetes.io/role-config-secrets"
}