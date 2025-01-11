# terraform-state/main.tf
provider "aws" {
  region = "eu-west-2"
}

# Creates S3 bucket for state file
resource "aws_s3_bucket" "terraform_state" {
  bucket = "easy-school-terraform-state"
}

# Enables versioning on the bucket
resource "aws_s3_bucket_versioning" "terraform_state" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Creates DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_lock" {
  name           = "easy-school-terraform-lock"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}