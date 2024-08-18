resource "aws_vpc" "eks_vpc" {
  cidr_block           = "10.0.0.0/16"
  instance_tenancy     = "default"
  enable_dns_support   = true
  enable_dns_hostnames = true

  tags = {
    Name    = "eks-vpc"
    Billing = "eks-billing"
  }
}

resource "aws_subnet" "eks_subnet_public_1a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name    = "eks_subnet_public_1a"
    Billing = "eks_billing"

  }
}

resource "aws_subnet" "eks_subnet_private_1b" {
  vpc_id            = aws_vpc.eks_vpc.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name    = "eks_subnet_private_1b"
    Billing = "eks-billing"
  }
}