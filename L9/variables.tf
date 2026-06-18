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