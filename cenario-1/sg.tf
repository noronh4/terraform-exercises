resource "aws_security_group" "allow_ssh_icmp_public" {
  name = "allow_ssh_icmp_public"
  description = "Allow SSH and ICMP inbound traffic to all"
  vpc_id = aws_vpc.VPC-CENARIO-1.id

  tags = {
    Name = "TERRAFORM-CENARIO-1"
  }

  depends_on = [ aws_vpc.VPC-CENARIO-1 ]
}

resource "aws_security_group" "allow_ssh_icmp_private" {
  name = "allow_ssh_icmp_private"
  description = "Allow SSH only to the public subnet and ICMP inbound traffic"
  vpc_id = aws_vpc.VPC-CENARIO-1.id

  tags = {
    Name = "TERRAFORM-CENARIO-1"
  }

  depends_on = [ aws_vpc.VPC-CENARIO-1 ]
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4_public" {
  security_group_id = aws_security_group.allow_ssh_icmp_public.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_ssh_ipv4_private" {
  security_group_id = aws_security_group.allow_ssh_icmp_private.id
  cidr_ipv4         = aws_subnet.SUBNET-CENARIO-1-PUBLIC.cidr_block
  from_port         = 22
  ip_protocol       = "tcp"
  to_port           = 22
}

resource "aws_vpc_security_group_ingress_rule" "allow_icmp_ipv4_public" {
  security_group_id = aws_security_group.allow_ssh_icmp_public.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = -1
  ip_protocol       = "icmp"
  to_port           = -1
}

resource "aws_vpc_security_group_ingress_rule" "allow_icmp_ipv4_private" {
  security_group_id = aws_security_group.allow_ssh_icmp_private.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = -1
  ip_protocol       = "icmp"
  to_port           = -1
}

resource "aws_vpc_security_group_ingress_rule" "allow_http_ipv4_private" {
  security_group_id = aws_security_group.allow_ssh_icmp_private.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 80
  ip_protocol       = "tcp"
  to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_https_ipv4_private" {
  security_group_id = aws_security_group.allow_ssh_icmp_private.id
  cidr_ipv4         = "0.0.0.0/0"
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_public" {
  security_group_id = aws_security_group.allow_ssh_icmp_public.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}

resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4_private" {
  security_group_id = aws_security_group.allow_ssh_icmp_private.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}