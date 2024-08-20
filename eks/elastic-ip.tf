resource "aws_eip" "nat_gateway_private_1a" {
  domain = "vpc"
}

resource "aws_eip" "nat_gateway_private_1b" {
  domain = "vpc"
}