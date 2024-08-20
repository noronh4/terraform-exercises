resource "aws_nat_gateway" "nat_gateway_public_1a" {
  allocation_id = aws_eip.nat_gateway_private_1a.id
  subnet_id     = aws_subnet.eks_subnet_public_1a.id

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-nat_gateway_public_1a"
    }
  )

}

resource "aws_nat_gateway" "nat_gateway_public_1b" {
  allocation_id = aws_eip.nat_gateway_private_1a.id
  subnet_id     = aws_subnet.eks_subnet_private_1b.id

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-nat_gateway_public_1a"
    }
  )

}