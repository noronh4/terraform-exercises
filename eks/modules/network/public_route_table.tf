resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.eks_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-route_table_public"
    }
  )

}

#route-table-association
resource "aws_route_table_association" "route_table_association_subnet_public_1" {
  subnet_id      = aws_subnet.eks_subnet_public_1a.id
  route_table_id = aws_route_table.route_table_public.id


}

#route-table-association
resource "aws_route_table_association" "route_table_association_subnet_public_2" {
  subnet_id      = aws_subnet.eks_subnet_private_1b.id
  route_table_id = aws_route_table.route_table_public.id

}