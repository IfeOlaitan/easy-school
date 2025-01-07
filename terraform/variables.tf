variable "aws_region" {
  description = "AWS region to deploy resources"
  type        = string
  default     = "eu-west-2"
}

variable "project_name" {
  description = "Name prefix for all resources"
  type        = string
  default     = "easy-school"
}

# Networking variables
variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.0.1.0/24" # Provides 256 IP addresses
}

# Compute variables
variable "instance_type" {
  description = "EC2 instance type for the application"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-019374baf467d6601" # Amazon Linux in eu-west-2
}

variable "key_pair" {
  description = "Docker image to run on the instance"
  type        = string
  default     = "ubuntu-kp"
}

# Application variables
variable "docker_image" {
  description = "Docker image to run on the EC2 instance"
  type        = string
  default     = "ifeolaitan/easy-school:v1"
}

variable "application_port" {
  description = "Port on which the application runs"
  type        = number
  default     = 8000
}