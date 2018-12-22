#----------storage/main.tf-------

# Create a random id
# resource "random_id" "state_bucket_id" {
#   byte_length = 2
# }

# Create a log bucket to store log file
resource "aws_s3_bucket" "log_bucket" {
  bucket = "${var.s3_log_bucket_name}"
  acl    = "${var.s3_log_bucket_acl}"
  force_destroy = "${var.s3_log_bucket_force_destroy}"

  versioning {
    enabled = "${var.s3_log_bucket_versioning}"
  }
}


# Create a bucket to store terraform state file
resource "aws_s3_bucket" "state_bucket" {
  bucket        = "${var.s3_bucket_name}"  
  acl           = "${var.s3_bucket_acl}"
  force_destroy = "${var.s3_bucket_force_destroy}"
  
  tags {
    Name = "tf_bucket"
    Environment = "${var.environment}"
  }

  versioning {
    enabled = "${var.s3_bucket_versioning}"
  }

  logging {
    target_bucket = "${aws_s3_bucket.log_bucket.id}"
    target_prefix = "log/"
  }
}