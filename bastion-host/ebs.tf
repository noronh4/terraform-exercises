resource "aws_ebs_volume" "ebs_ec2_public" {
  availability_zone = "us-east-1a"
  size              = 2

  tags = {
    Name = "TERRAFORM-CENARIO-1"
  }
}

resource "aws_ebs_volume" "ebs_ec2_private" {
  availability_zone = "us-east-1b"
  size              = 2

  tags = {
    Name = "TERRAFORM-CENARIO-1"
  }
}

resource "aws_volume_attachment" "ebs_att_ec2_public" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs_ec2_public.id
  instance_id = aws_instance.ec2_public.id

}

resource "aws_volume_attachment" "ebs_att_ec2_private" {
  device_name = "/dev/xvdh"
  volume_id   = aws_ebs_volume.ebs_ec2_private.id
  instance_id = aws_instance.ec2_private.id
}