variable "name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = "itw's"
}
variable "environment" {
  description = "The environment for the S3 bucket"
  type        = string
  default     = "Dev"
}
variable "region" {
  description = "The AWS region for the S3 bucket"
  type        = string
  default     = "us-east-2"
}
variable "instance_count" {
  description = "The number of EC2 instances to create"
  type        = number
  default     = 1
}
variable "monitoring" {
  description = "Enable monitoring for the EC2 instances"
  type        = bool
  default     = true
}
variable "associate_public_ip" {
  description = "Whether to associate a public IP address with the EC2 instances"
  type        = bool
  default     = true
}
variable "tags" {
  description = "A map of tags to assign to the resources"
  type        = map(string)
  default     = {
    Environment = "Dev"
    Project     = "TerraformLearning"
  }
}