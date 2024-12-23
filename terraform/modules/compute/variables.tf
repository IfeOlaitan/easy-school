variable "ami_id" {
  description = "AMI ID for EC2 instance"
  type        = string
  default     = "ami-0735c191cf914754d"  # Amazon Linux 2023 in us-west-2 (uodate this)
}

variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t2.micro"
}

variable "subnet_id" {
  description = "Subnet ID where EC2 instance will be launched"
  type        = string
}

variable "security_group_id" {
  description = "Security group ID for EC2 instance"
  type        = string
}

variable "docker_image" {
  description = "Docker image to run on the instance"
  type        = string
}

//i am back
