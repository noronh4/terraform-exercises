resource "aws_vpc" "eks_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name                     = "eks-vpc"
    Billing                  = "eks-billing"
    "kubernetes.io/role/elb" = 1
  }
}

data "aws_region" "current" {}

resource "aws_subnet" "eks_subnet_public_1a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_region.current.name}a"

  tags = {
    Name    = "eks_subnet_public_1a"
    Billing = "eks_billing"

  }
}

resource "aws_subnet" "eks_subnet_private_1b" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "${data.aws_region.current.name}b"

  tags = {
    Name                              = "eks_subnet_private_1b"
    Billing                           = "eks-billing"
    "kubernetes.io/role/internal-elb" = 1
  }
}