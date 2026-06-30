
resource "aws_instance" "itw" {
  count         = var.instance_count
  ami           = "ami-0a1b6a02658659c2a"
  instance_type = var.allowed_vm_types[1]
  region        = var.region
  tags = {
    Name        = "local.vpc_id"
    Environment = var.environment
    monitoring   = var.monitoring
    associate_public_ip_address = var.associate_public_ip
  }
}
resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"

  tags = {
    Name = "allow_tls"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = aws_vpc.main.cidr_block
  from_port         = 443
  ip_protocol       = "tcp"
  to_port           = 443
}


resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
  security_group_id = aws_security_group.allow_tls.id
  cidr_ipv4         = "0.0.0.0/0"
  ip_protocol       = "-1" # semantically equivalent to all ports
}
