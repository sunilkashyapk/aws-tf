provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "public_key_auth" {
  key_name   = "${var.public_key_name}"
  public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "instance" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    key_name = "${aws_key_pair.public_key_auth.id}"
}

resource "aws_security_group" "public_open" {
  name        = "public_allow_all"
  description = "Allow all inbound traffic"
  vpc_id      = "vpc-a46a7bdf"

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}