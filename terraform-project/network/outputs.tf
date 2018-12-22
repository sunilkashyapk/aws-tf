#-----networking/outputs.tf

output "public_subnet" {
  value = "${aws_subnet.public_subnet.id}"
}

output "private_subnet" {
  value = "${aws_subnet.private_subnet.id}"
}
output "public_sg" {
  value = "${aws_security_group.tf_public_sg.id}"
}

output "subnet_ips" {
  value = "${aws_subnet.public_subnet.cidr_block}"
}

