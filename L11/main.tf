resource "aws_instance" "new1" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = var.allowed_instance_types[1]
  region = tolist(var.allowed_regions)[0]
  tags= var.instance_tags
  }
