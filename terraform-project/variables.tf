# variable "project_name" {
    # type = "string"    
# }

variable "terraform_state_lock_table" {
    type = "string"
}

variable "environment" {
    type = "string"    
}

variable "s3_log_bucket_name" {
    type = "string"    
}

variable "s3_log_bucket_acl" {
    type = "string"   
}

variable "s3_bucket_name" {
    type = "string"    
}

variable "s3_bucket_acl" {
    type = "string"    
}

variable "s3_log_bucket_versioning" {
    type = "string"   
}

variable "s3_bucket_versioning" {
    type = "string"    
}

variable "s3_log_bucket_force_destroy" {
    type = "string"    
}

variable "s3_bucket_force_destroy" {
    type = "string"    
}

variable "vpc_cidr" {
  type = "string"
}

variable "public_cidrs" {
    type = "list"
}

variable "accessip" {
    type = "string"
}

# vpc_cidr     = "${var.vpc_cidr}"
#   public_cidrs = "${var.public_cidrs}"
#   accessip     = "${var.accessip}"
