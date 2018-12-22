output "state_bucket_name" {
  value = "${aws_s3_bucket.state_bucket.id}"
}

output "log_bucket_name" {
  value = "${aws_s3_bucket.log_bucket.id}"
}