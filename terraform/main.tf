terraform {
  required_version = ">= 1.6.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "eu-west-1"
}


resource "aws_instance" "nginx-node" {
  ami                    = "ami-08b6a2983df6e9e25"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-02f408ff476473c54"
  vpc_security_group_ids = ["sg-08066d21f1c67650e"]
  key_name               = "masterclass2025"

  tags = {
    Name = "terraform-nginx-node"
  }
}