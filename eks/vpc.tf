resource "aws_vpc" "eks_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name                     = "${var.project_name}-vpc"
    Billing                  = "eks-billing"
    "kubernetes.io/role/elb" = 1
  }
}