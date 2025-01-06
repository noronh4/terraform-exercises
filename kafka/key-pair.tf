resource "aws_key_pair" "ec2_public_key_pair" {
  key_name   = "ec2-private-key-pair-kafka-lab"
  public_key = file("./ec2-private-key-pair-kafka-lab.pub")
}