locals {
  bucket_name = "${var.name}-bucket-${var.environment}-${var.region}"
  vpc_id      = "${var.name}-${var.environment}-vpc-${var.region}"
}