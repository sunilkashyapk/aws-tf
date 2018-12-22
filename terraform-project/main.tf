provider "aws" {
  
}

#Deploy Storage Resource
module "storage" {
 source       = "./storage"
 s3_log_bucket_name ="${var.s3_log_bucket_name}" 
 s3_log_bucket_acl ="${var.s3_log_bucket_acl}"
 s3_log_bucket_force_destroy ="${var.s3_bucket_force_destroy}" 
 s3_log_bucket_versioning = "${var.s3_log_bucket_versioning}"
 #project_name = "" 
 s3_bucket_name = "${var.s3_bucket_name}"
 s3_bucket_acl = "${var.s3_bucket_acl}"
 s3_bucket_force_destroy = "${var.s3_bucket_force_destroy}"
 environment = "${var.environment}"
 s3_bucket_versioning = "${var.s3_bucket_versioning}"
}

# create a dynamodb table for locking the state file
resource "aws_dynamodb_table" "dynamodb-terraform-state-lock" {
  name = "${var.terraform_state_lock_table}"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
 
  tags {
    Name = "DynamoDB Terraform State Lock Table"
  }
}

# create s3 backend to store remote terraform state
terraform {
  backend "s3" {
    bucket = "nirmaan-infrastructure"
    key    = "infrastructure.state"
    region = "ap-southeast-1"
    dynamodb_table = "terraform-state-lock-dynamo"
    encrypt = true
  }
}

# Deploy Networking Resources
module "networking" {
  source       = "./network"
  vpc_cidr     = "${var.vpc_cidr}"
  public_cidrs = "${var.public_cidrs}"
  accessip     = "${var.accessip}"
}