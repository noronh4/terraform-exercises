#internet_gateway
resource "aws_internet_gateway" "igw-CENARIO-1" {
  vpc_id = aws_vpc.VPC-CENARIO-1.id

  tags = {
    Name = "TERRAFORM-CENARIO-1"
  }

  depends_on = [aws_vpc.VPC-CENARIO-1]

}