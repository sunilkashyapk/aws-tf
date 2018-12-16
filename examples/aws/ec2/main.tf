provider "aws" {
  region = "us-east-1"
}

resource "aws_key_pair" "public_key_auth_1" {
  key_name   = "${var.public_key_name}"
  public_key = "${file(var.public_key_path)}"
}

resource "aws_instance" "instance" {
    ami = "${var.ami}"
    instance_type = "${var.instance_type}"
    key_name = "${aws_key_pair.public_key_auth_1.id}"
     provisioner "file" {
      source      = "setup.sh"
      destination = "/tmp/setup.sh"
      connection {
        type     = "ssh"
        user     = "ubuntu"
      }
    }
    provisioner "remote-exec" {
      inline = ["sudo mv /tmp/setup.sh /usr/local/bin/setup.sh","chmod +x /usr/local/bin/setup.sh", "setup.sh"]
      connection {
        type     = "ssh"
        user     = "ubuntu"
      }
    }
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