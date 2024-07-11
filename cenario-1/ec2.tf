resource "aws_instance" "ec2_public" {
  ami = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.SUBNET-CENARIO-1-PUBLIC.id
  vpc_security_group_ids = [aws_security_group.allow_ssh_icmp_public.id]

  key_name = aws_key_pair.ec2_public_key_pair.id

  user_data = <<-EOF
            #!/bin/bash
            exec > >(tee /var/log/user-data.log | logger -t user-data) 2>&1
            sleep 30 # garantir a inicialização do sistema
            sudo mkfs -t ext4 /dev/xvdh
            sudo mkdir /mnt/xvdh/
            sudo mount /dev/xvdh /mnt/xvdh/
            EOF

            
  provisioner "file" {
    source      = "./ec2-privatekey"
    destination = "/home/ubuntu/.ssh/ec2-privatekey"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./ec2-privatekey")
      host        = self.public_ip
    }
  }

  tags = {
    Name = "TERRAFORM-CENARIO-1"
  }

  depends_on = [ aws_vpc.VPC-CENARIO-1 ] 

}

resource "aws_instance" "ec2_private" {
  ami = "ami-04a81a99f5ec58529"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.SUBNET-CENARIO-1-PRIVATE.id
  vpc_security_group_ids = [aws_security_group.allow_ssh_icmp_private.id]
  key_name = aws_key_pair.ec2_public_key_pair.id

  tags = {
    Name = "TERRAFORM-CENARIO-1"
  }

  depends_on = [ aws_vpc.VPC-CENARIO-1 ]

}
