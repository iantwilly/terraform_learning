output "formatted_project_name" {
  value = local.formatted_project_name
}
output "new_project_name" {
  value = local.new_project_name
}
output "s3_bucket_name" {
  value = aws_s3_bucket.itw.bucket
}
output "sg_rules" {
  value = local.sg_rules
}
output "instance_size" {
  value = local.instance_size
}