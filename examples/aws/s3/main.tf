provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "bucket" {
    bucket = "${var.s3_bucket_name}"
    acl = "${var.s3_bucket_acl}"
    versioning {
        enabled = "${var.s3_bucket_versioning}"
    }
    force_destroy = "${var.s3_bucket_force_destroy}"
}