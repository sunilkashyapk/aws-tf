resource "aws_vpc" "tf_sandbox_vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "TF Sandbox VPC"
  }
}

resource "aws_subnet" "tf_private_subnet" {
  vpc_id     = "${aws_vpc.tf_sandbox_vpc.id}"
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "TF Sandbox Subnet"
  }
}