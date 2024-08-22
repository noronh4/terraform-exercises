resource "aws_subnet" "eks_subnet_private_1a" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.0.3.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_region.current.name}a"

  tags = merge(
    var.tags,
    {
      Name                              = "${var.project_name}-subnet_private_1a"
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}

resource "aws_subnet" "eks_subnet_private_1b" {
  vpc_id                  = aws_vpc.eks_vpc.id
  cidr_block              = "10.0.4.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "${data.aws_region.current.name}b"

  tags = merge(
    var.tags,
    {
      Name                              = "${var.project_name}-subnet_private_1b"
      "kubernetes.io/role/internal-elb" = 1
    }
  )
}