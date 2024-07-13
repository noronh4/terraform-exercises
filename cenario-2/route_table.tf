resource "aws_route_table" "route_table_public" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  tags = {
    Name = "route_table_public"
    Env  = "cenario_2"
  }

  depends_on = [aws_internet_gateway.internet_gateway]

}

#route-table-association
resource "aws_route_table_association" "route_table_association_subnet_public_1" {
  subnet_id      = aws_subnet.subnet_public_1.id
  route_table_id = aws_route_table.route_table_public.id

  depends_on = [aws_route_table.route_table_public]

}

#route-table-association
resource "aws_route_table_association" "route_table_association_subnet_public_2" {
  subnet_id      = aws_subnet.subnet_public_2.id
  route_table_id = aws_route_table.route_table_public.id

  depends_on = [aws_route_table.route_table_public]

}