terraform {
  backend "s3" {
    bucket       = "itw-terraform01-state"
    key          = "dev/terraform.tfstate"
    region       = "us-east-2"
    encrypt      = true
    use_lockfile = true
  }
}