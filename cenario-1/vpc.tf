terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.56.1"
    }
  }
}

provider "aws" {
  shared_config_files      = ["$HOME/.aws/config"]
  shared_credentials_files = ["$HOME/.aws/credentials"]
  profile = "default"

}


resource "aws_vpc" "VPC-CENARIO-1" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "TERRAFORM-CENARIO-1"
  }
}

resource "aws_subnet" "SUBNET-CENARIO-1-PUBLIC" {
  vpc_id                  = aws_vpc.VPC-CENARIO-1.id
  cidr_block              = "10.0.1.0/24"
  map_public_ip_on_launch = true
  availability_zone       = "us-east-1a"

  tags = {
    Name = "TERRAFORM-CENARIO-1"
  }
}

resource "aws_subnet" "SUBNET-CENARIO-1-PRIVATE" {
  vpc_id            = aws_vpc.VPC-CENARIO-1.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = "us-east-1b"

  tags = {
    Name = "TERRAFORM-CENARIO-1"
  }
}


