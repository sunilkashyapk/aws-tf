terraform {
  backend "s3" {
    bucket = "sunil-tf-state"
    key    = "examples/aws/vpc"
    region = "us-east-1"
    encrypt = true
  }
}