variable "s3_bucket_name" {
    type = "string"
    default = "sunil-kashyap"
}

variable "s3_bucket_acl" {
    type = "string"
    default = "private"
}

variable "s3_bucket_versioning" {
    type = "string"
    default = true
}

variable "s3_bucket_force_destroy" {
    type = "string"
    default = true
}