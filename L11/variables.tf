variable "project_name" {
  default = "ITW Terraform Project"
}
variable "default_tags" {
  default = {
    company    = "MapleLabs"
    managed_by = "Terraform"
  }
}
variable "environment_tags" {
  default = {
    environment = "prod-us"
    cost_center = "cc-2468"
  }
}
variable "bucket_name" {
  default = "itw terraform bucket with spaces and special characters"
}
variable "allowed_ports" {
  default = "22,443,80,8080,9000"
}
variable "instance_size"{
  default = {
    dev="t2.micro"
    prod="t3.large"
    staging="t2.medium"
  }
}
variable "environment" {
  default = "dev"
}
