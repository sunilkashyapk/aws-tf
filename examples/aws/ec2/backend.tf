terraform {
  backend "s3" {
    bucket = "sunil-tf-state"
    key    = "examples/aws/ec2"
    region = "us-east-1"
    encrypt = true
  }
}