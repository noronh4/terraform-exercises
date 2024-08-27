resource "aws_eks_cluster" "eks_cluster" {
  name     = "${var.project_name}-eks_cluster"
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    subnet_ids = [
      var.subnet_public_1a,
      var.subnet_public_1b
    ]
    endpoint_private_access = true
    endpoint_public_access  = true
  }

  # Ensure that IAM Role permissions are created before and deleted after EKS Cluster handling.
  # Otherwise, EKS will not be able to properly delete EKS managed EC2 infrastructure such as Security Groups.
  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_role_attachment,
  ]

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eks_cluster"
    }
  )
}

#output "endpoint" {
#  value = aws_eks_cluster.eks_cluster_role.endpoint
#}



#output "kubeconfig-certificate-authority-data" {
#  value = aws_eks_cluster.example.certificate_authority[0].data
#}