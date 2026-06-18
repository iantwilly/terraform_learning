terraform {
  backend "s3" {
    bucket       = "itw-terraform1-state"
    key          = "dev/terraform.tfstate"
    region       = "us-east-1"
    encrypt      = true
    use_lockfile = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "6.49.0"
    }
  }
}

provider "aws" {
  # Configuration options
  region = "us-east-1"
}
#Create  an S3 bucket
resource "aws_s3_bucket" "itw" {
  bucket = "my-itw-bucket-2026"

  tags = {
    Name        = "ians"
    Environment = "Dev"
  }
}