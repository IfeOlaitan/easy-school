terraform {
  backend "s3" {
    bucket         = "easy-school-terraform-state"
    key            = "terraform.tfstate"
    region         = var.aws_region
    dynamodb_table = "easy-school-terraform-lock"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.61.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}