resource "aws_route_table" "rt-public-CENARIO-1" {
  vpc_id = aws_vpc.VPC-CENARIO-1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.igw-CENARIO-1.id
  }

  tags = {
    Name = "TERRAFORM-CENARIO-1"
  }

  depends_on = [aws_internet_gateway.igw-CENARIO-1]

}

#route-table-association
resource "aws_route_table_association" "route_table_association-public" {
  subnet_id      = aws_subnet.SUBNET-CENARIO-1-PUBLIC.id
  route_table_id = aws_route_table.rt-public-CENARIO-1.id

  depends_on = [aws_route_table.rt-public-CENARIO-1]

}


#route-table-private
resource "aws_route_table" "RT-PRIVATE-CENARIO-1" {
  vpc_id = aws_vpc.VPC-CENARIO-1.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.nat-gateway-CENARIO-1.id
  }

  tags = {
    Name = "TERRAFORM-CENARIO-1"
  }

  depends_on = [aws_nat_gateway.nat-gateway-CENARIO-1]

}

#route-table-association
resource "aws_route_table_association" "route_table_association-private" {
  subnet_id      = aws_subnet.SUBNET-CENARIO-1-PRIVATE.id
  route_table_id = aws_route_table.RT-PRIVATE-CENARIO-1.id

  depends_on = [aws_route_table.RT-PRIVATE-CENARIO-1]

}