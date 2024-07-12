resource "aws_launch_template" "web_server" {
  name = "launch_template_web_server"


  block_device_mappings {
    device_name = "/dev/xvdh"

    ebs {
      volume_size = 2
    }
  }

  image_id               = "ami-04a81a99f5ec58529"
  instance_type          = "t2.micro"
  key_name               = aws_key_pair.ec2_public_key_pair.id
  user_data              = filebase64("./script.sh")
  vpc_security_group_ids = [aws_security_group.allow_http_ssh.id]

  placement {
    availability_zone = "us-east-1a"
  }

  monitoring {
    enabled = true
  }

  network_interfaces {
    associate_public_ip_address = true
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Env = "cenario_2"
    }
  }

  tags = {
    Env = "cenario_2"
  }

  depends_on = [aws_vpc.vpc]

}