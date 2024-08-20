resource "aws_route_table" "route_table_private_1a" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_public_1a.id
  }

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-route_table_private_1a"
    }
  )

}

resource "aws_route_table" "route_table_private_1b" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway_public_1b.id
  }

  tags = merge(
    local.tags,
    {
      Name = "${var.project_name}-route_table_private_1a"
    }
  )

}

#route-table-association
resource "aws_route_table_association" "route_table_association_subnet_private_1a" {
  subnet_id      = aws_subnet.eks_subnet_private_1a.id
  route_table_id = aws_route_table.route_table_private_1a.id


}

#route-table-association
resource "aws_route_table_association" "route_table_association_subnet_private_1b" {
  subnet_id      = aws_subnet.eks_subnet_private_1b.id
  route_table_id = aws_route_table.route_table_private_1b.id

}