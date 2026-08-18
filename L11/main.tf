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
  sg_rules =[for port in local.port_list : { #for  loop  is being  used  to  iterate  through  the  list  of  ports  and  create  a  security  group  rule  for  each  port
    name = "port-${port}" # this will  give an output like port-22, port-443, etc
    port=port #this is  the  port  which gets passed  to  the  security  group  rule
    description = "Allow traffic on port ${port}" # this is  the  description  for  the  security  group  rule
  }]
  #lookupfunction  is  being  used  to  get  the  instance  size  based  on  the  environment
  #lookup(inputMap dynamic, key string, ...default dynamic) dynamic 
  #lookup retrieves the value of a single element from a map, given its key. If the given key does not exist, the given default value is returned instead.
  instance_size = lookup(var.instance_size, var.environment, "t2.micro") 

}
resource "aws_s3_bucket" "itw" {
  bucket = "${local.new_project_name}-version-1"
  tags   = local.new_tags
}
resource "aws_s3_bucket" "itw_v2" {
  bucket = local.new_buckets
  tags   = local.new_tags
}
