resource "aws_iam_role" "autoscaler" {
  count = var.cluster_autoscaler_enabled ? 1 : 0
  name  = "${module.odc_eks_cluster_label.id}-autoscaler"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    },
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "AWS": "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/nodes.${module.odc_eks_cluster_label.id}"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF

}

resource "aws_iam_role_policy" "autoscaler_policy" {
  count = var.cluster_autoscaler_enabled ? 1 : 0
  name = "${module.odc_eks_cluster_label.id}-autoscaler-policy"
  role = aws_iam_role.autoscaler[0].id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
          "autoscaling:DescribeAutoScalingGroups",
          "autoscaling:DescribeAutoScalingInstances",
          "autoscaling:DescribeLaunchConfigurations",
          "autoscaling:DescribeTags",
          "autoscaling:SetDesiredCapacity",
          "autoscaling:TerminateInstanceInAutoScalingGroup",
          "ec2:DescribeLaunchTemplateVersions"
      ],
      "Resource": "*"
    }
  ]
}
EOF
}
