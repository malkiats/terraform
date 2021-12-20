provider "aws" {
    region = "ap-southeast-1"
    access_key = ""
    secret_key = ""
}

resource "aws_instance" "jenkins" {
    ami = "ami-0b1e534a4ff9019e0"
    instance_type = "t2.small"
}