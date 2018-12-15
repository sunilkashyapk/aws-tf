variable "ami" {
    type = "string"
    default = "ami-0ac019f4fcb7cb7e6"
}

variable "instance_type" {
    type = "string"
    default = "t2.micro"
}

variable "public_key_name" {
    type = "string"
    default = "tf_public_key"
}

variable "public_key_path" {
    type = "string"
    default = "~/.ssh/id_rsa.pub"
}
