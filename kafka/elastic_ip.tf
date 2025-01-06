resource "aws_eip" "kafka-broker-1" {
  instance = aws_instance.kafka-broker-1.id
  domain   = "vpc"

  tags = {
    Name = "Kafka-broker-1"
  }
}

resource "aws_eip" "kafka-broker-2" {
  instance = aws_instance.kafka-broker-2.id
  domain   = "vpc"

  tags = {
    Name = "Kafka-broker-2"
  }
}