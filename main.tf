terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = "ap-south-1"
}

resource "aws_instance" "kube_server" {
  ami           = "ami-0f58b397bc5c1f2e8"
  instance_type = "t2.micro"
  key_name      = "prt-key"

  tags = {
    Name = "kube-server"
  }
}

output "kube_server_ip" {
  value = aws_instance.kube_server.public_ip
}
