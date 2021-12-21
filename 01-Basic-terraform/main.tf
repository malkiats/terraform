# Settings Block  
terraform {
    required_providers {
        aws = {
            source = "hashicorp/aws"
            #version = "~> 3.21" # Optional
        }
    }
}

# Provider
provider "aws" {
    profile = "default" #Credential profile
    region = "ap-southeast-1"
    #access_key = ""
    #secret_key = ""
}

# Resource
resource "aws_instance" "jenkins" {     // Block type & Block labels & Block inside block
    ami = "ami-0dc5785603ad4ff54"       // AWS Linux // Argument name & Argument value
    instance_type = "t2.micro"
}

/*
Multi-line
comments
*/