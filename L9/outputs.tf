output "vpc_id" {
    value = aws_vpc.itw.id
  
}
output "bucket_name" {
    value = local.bucket_name
}
output "vpc_name" {
    value = local.vpc_id
}