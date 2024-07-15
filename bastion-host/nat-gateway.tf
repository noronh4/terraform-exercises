# Create NAT Gateway Elastic IP
resource "aws_eip" "nat_eip-CENARIO-1" {
  domain = "vpc"
  depends_on = [aws_internet_gateway.igw-CENARIO-1]
}

resource "aws_nat_gateway" "nat-gateway-CENARIO-1" {
  allocation_id = aws_eip.nat_eip-CENARIO-1.id
  subnet_id     = aws_subnet.SUBNET-CENARIO-1-PUBLIC.id

  tags = {
    Name = "TERRAFORM-CENARIO-1"
  }

  depends_on = [aws_eip.nat_eip-CENARIO-1]

}