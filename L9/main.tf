
#Create  an S3 bucket
resource "aws_s3_bucket" "itw" {
  bucket = "my-itw-bucket-2026"

  tags = {
    Name        = "local.bucket_name"
    Environment = "local.var.environment"
  }
}

resource "aws_vpc" "itw" {
  cidr_block = "10.0.0.0/16"
  region     = var.region
  tags = {
    Name        ="itw-vpc"
    Environment = var.environment
  }
}
resource "aws_instance" "itw" {
  ami           = "ami-0a1b6a02658659c2a"
  instance_type = "t3.small"
  region        = var.region
  tags = {
    Name        = "local.vpc_id"
    Environment = var.environment
  }
}