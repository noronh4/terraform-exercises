resource "aws_network_interface" "kafka-broker-1" {
  subnet_id       = aws_subnet.subnet_public_1.id
  private_ips     = ["10.0.1.10"]
  security_groups = [aws_security_group.allow_all.id]

  attachment {
    instance     = aws_instance.kafka-broker-1.id
    device_index = 1
  }

  tags = {
    Name = "eni-Kafka-broker-1"
    Env  = "Kafka-lab"
  }

}

resource "aws_network_interface" "kafka-broker-2" {
  subnet_id       = aws_subnet.subnet_public_1.id
  private_ips     = ["10.0.1.20"]
  security_groups = [aws_security_group.allow_all.id]

  attachment {
    instance     = aws_instance.kafka-broker-2.id
    device_index = 1
  }

  tags = {
    Name = "eni-Kafka-broker-2"
    Env  = "Kafka-lab"
  }

}

resource "aws_network_interface" "kafka-broker-3" {
  subnet_id       = aws_subnet.subnet_public_1.id
  private_ips     = ["10.0.1.30"]
  security_groups = [aws_security_group.allow_all.id]

  attachment {
    instance     = aws_instance.kafka-broker-3.id
    device_index = 1
  }

  tags = {
    Name = "eni-Kafka-broker-3"
    Env  = "Kafka-lab"
  }
}