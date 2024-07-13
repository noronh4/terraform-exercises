resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name = "internet_gateway"
    Env  = "cenario_2"
  }

  depends_on = [aws_vpc.vpc]

}