terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.43.0"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_instance" "web-server" {
  ami           = "ami-0a1b6a02658659c2a"
  instance_type = var.my_instnace_type

}
output "public_ip" {
  value       = aws_instance.web-server.public_ip
  description = "This is  the EC2 public IP"
}