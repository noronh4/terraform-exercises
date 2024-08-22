resource "aws_eip" "eip_nat_gateway_private_1a" {
  domain = "vpc"

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip_nat_gateway_private_1a"
    }
  )
}

resource "aws_eip" "eip_nat_gateway_private_1b" {
  domain = "vpc"

  tags = merge(
    var.tags,
    {
      Name = "${var.project_name}-eip_nat_gateway_private_1b"
    }

  )
}