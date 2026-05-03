variable "region" {
  type        = string
  description = "This is the AWS region"
  default     = "us-east-1"

}
variable "my_aws_key" {
  type        = string
  description = "AWS key to SSH to  the EC2 instance"
  default     = "mykey.pem"
}
variable "my_instnace_type" {
  type        = string
  description = "This is  the  instance type"
  default     = "t3.small"

}