terraform {
  backend "s3" {
    bucket = "<default_name>"
    key = "config/s3/terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "<default_name>"
    encrypt = true
    
  }
  required_version = ">= 1.2.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.49.0"
    }
  }
}

