resource "aws_instance" "ec2_public" {
  ami = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.SUBNET-CENARIO-1-PUBLIC
  security_groups = [ "aws_security_group.allow_ssh_icmp_public.id" ]
  key_name = aws_key_pair.ec2_private_key_pair.key_name

  tags = {
    Name = "TERRAFORM-CENARIO-1"
  }
  
  depends_on = [ aws_vpc.VPC-CENARIO-1 ]

}

resource "aws_instance" "ec2_private" {
  ami = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.SUBNET-CENARIO-1-PRIVATE
  security_groups = [ "aws_security_group.allow_ssh_icmp_private.id" ]

  tags = {
    Name = "TERRAFORM-CENARIO-1"
  }

  depends_on = [ aws_vpc.VPC-CENARIO-1 ]

}

resource "aws_ebs_volume" "ebs_ec2_public" {
  availability_zone = "us-east-1a"
  size              = 2

  tags = {
    Name = "TERRAFORM-CENARIO-1"
  }
}

resource "aws_ebs_volume" "ebs_ec2_private" {
  availability_zone = "us-east-1a"
  size              = 2

  tags = {
    Name = "TERRAFORM-CENARIO-1"
  }
}

resource "aws_volume_attachment" "ebs_att_ec2_public" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_ec2_public.id
  instance_id = aws_instance.ec2_public

}

resource "aws_volume_attachment" "ebs_att_ec2_private" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_ec2_private
  instance_id = aws_instance.ec2_private
}