resource "aws_key_pair" "ec2_public_key_pair" {
  key_name   = "ec2_private_key_pair"
  public_key = file("./ec2-privatekey.pub")
}