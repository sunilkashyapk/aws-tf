# variable "project_name" {
#     type = "string"
#     #default = "nirman-state"
# }

variable "environment" {
    type = "string"
    #default = "nirman-state"
}

variable "s3_log_bucket_name" {
    type = "string"
    #default = "nirman-state-log"
}

variable "s3_log_bucket_acl" {
    type = "string"
    #default = "log-delivery-write"
}

variable "s3_bucket_name" {
    type = "string"
    #default = "nirman-state"
}

variable "s3_bucket_acl" {
    type = "string"
    #default = "private"
}

variable "s3_log_bucket_versioning" {
    type = "string"
    #default = true
}

variable "s3_bucket_versioning" {
    type = "string"
    #default = true
}

variable "s3_log_bucket_force_destroy" {
    type = "string"
    #default = true
}

variable "s3_bucket_force_destroy" {
    type = "string"
    #default = true
}