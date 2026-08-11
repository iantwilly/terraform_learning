locals {
  formatted_project_name = upper(var.project_name)
  new_project_name       = lower(replace(var.project_name, " ", "-"))
  new_tags               = merge(var.default_tags, var.environment_tags)
  new_buckets = replace(
    substr(
      lower(var.bucket_name)
    , 0, 20)
  , " ", "-")

  port_list = split(",", var.allowed_ports)
  sg_rules =[for port in local.port_list : {
    name = "port-${port}" # this will  give an output like port-22, port-443, etc
    port=port #this is  the  port  which gets passed  to  the  security  group  rule
    description = "Allow traffic on port ${port}" # this is  the  description  for  the  security  group  rule
  }]
}
resource "aws_s3_bucket" "itw" {
  bucket = "${local.new_project_name}-version-1"
  tags   = local.new_tags
}
resource "aws_s3_bucket" "itw_v2" {
  bucket = local.new_buckets
  tags   = local.new_tags
}