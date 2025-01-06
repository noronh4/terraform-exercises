resource "aws_instance" "kafka-broker-1" {
  ami                    = "ami-0e2c8caa4b6378d8c" # ami ubuntu
  instance_type          = "t2.small"
  subnet_id              = aws_subnet.subnet_public_1.id
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  key_name = aws_key_pair.ec2_public_key_pair.id

  user_data = <<-EOF
            #!/bin/bash
            apt update
            apt install docker.io -y

            sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
            sudo chmod +x /usr/local/bin/docker-compose
            docker-compose -v

            ip addr add 10.0.1.10/24 dev enX1
            ip route add 10.0.1.0/24 dev enX1
            sudo ip link set dev enX1 up

            EOF


  provisioner "file" {
    source      = "./broker-1/broker.properties"
    destination = "/home/ubuntu/kafka/broker.properties"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./ec2-private-key-pair-kafka-lab.pem")
      host        = self.public_ip
    }
  }

  provisioner "file" {
    source      = "./broker-1/docker-compose.yml"
    destination = "/home/ubuntu/kafka/docker-compose.yml"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./ec2-private-key-pair-kafka-lab.pem")
      host        = self.public_ip
    }
  }

  provisioner "file" {
    source      = "./broker-1/producer.py"
    destination = "/home/ubuntu/kafka/producer.py"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./ec2-private-key-pair-kafka-lab.pem")
      host        = self.public_ip
    }
  }

  tags = {
    Name = "Kafka-broker-1"
    Env  = "Kafka-lab"
  }
}

resource "aws_instance" "kafka-broker-2" {
  ami                    = "ami-0e2c8caa4b6378d8c" # ami ubuntu
  instance_type          = "t2.small"
  subnet_id              = aws_subnet.subnet_public_1.id
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  key_name = aws_key_pair.ec2_public_key_pair.id

  user_data = <<-EOF
            #!/bin/bash
            apt update
            apt install docker.io -y

            sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
            sudo chmod +x /usr/local/bin/docker-compose
            docker-compose -v

            ip addr add 10.0.1.20/24 dev enX1
            ip route add 10.0.1.0/24 dev enX1
            sudo ip link set dev enX1 up

            EOF


  provisioner "file" {
    source      = "./broker-2/broker.properties"
    destination = "/home/ubuntu/kafka/broker.properties"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./ec2-private-key-pair-kafka-lab.pem")
      host        = self.public_ip
    }
  }

  provisioner "file" {
    source      = "./broker-2/docker-compose.yml"
    destination = "/home/ubuntu/kafka/docker-compose.yml"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./ec2-private-key-pair-kafka-lab.pem")
      host        = self.public_ip
    }
  }

  tags = {
    Name = "Kafka-broker-2"
    Env  = "Kafka-lab"
  }

}


resource "aws_instance" "kafka-broker-3" {
  ami                    = "ami-0e2c8caa4b6378d8c" # ami ubuntu
  instance_type          = "t2.small"
  subnet_id              = aws_subnet.subnet_public_1.id
  vpc_security_group_ids = [aws_security_group.allow_all.id]

  key_name = aws_key_pair.ec2_public_key_pair.id

  user_data = <<-EOF
            #!/bin/bash
            apt update
            apt install docker.io -y

            sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
            sudo chmod +x /usr/local/bin/docker-compose
            docker-compose -v

            ip addr add 10.0.1.30/24 dev enX1
            ip route add 10.0.1.0/24 dev enX1
            sudo ip link set dev enX1 up

            EOF


  provisioner "file" {
    source      = "./broker-3/broker.properties"
    destination = "/home/ubuntu/kafka/broker.properties"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./ec2-private-key-pair-kafka-lab.pem")
      host        = self.public_ip
    }
  }

  provisioner "file" {
    source      = "./broker-3/docker-compose.yml"
    destination = "/home/ubuntu/kafka/docker-compose.yml"

    connection {
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("./ec2-private-key-pair-kafka-lab.pem")
      host        = self.public_ip
    }
  }

  tags = {
    Name = "Kafka-broker-3"
    Env  = "Kafka-lab"
  }

}

