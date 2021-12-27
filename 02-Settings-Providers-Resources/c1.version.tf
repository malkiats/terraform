# Terraform Block
terraform {
  required_version = "~> 1.1.2"
  required_providers {
    aws = {                     # Local name of your provider
      source = "hashicorp/aws"
      version = "~> 3.0"
     }
  }
}

# Provider Block
provider "aws" {    
  profile = "default"
  region = "ap-southeast-1"
}

/*
AWS Credentials Profile (profile = "default") on local terminal $Home/.aws/credentials
*/