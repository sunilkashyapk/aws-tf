output "EC2 instance IP Address"{
    value = "${aws_instance.instance.public_ip}"
}

output "EC2 instance id"{
    value = "${aws_instance.instance.id}"
}