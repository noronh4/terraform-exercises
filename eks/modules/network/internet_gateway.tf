resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.eks_vpc.id

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-internet_gateway"
    }
  )
}