# Networking outputs - helpful for understanding our network setup
output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.networking.vpc_id
}

output "public_subnet_id" {
  description = "The ID of the public subnet"
  value       = module.networking.public_subnet_id
}

# Security outputs - useful for debugging access issues
output "security_group_id" {
  description = "The ID of the main security group"
  value       = module.security.security_group_id
}

# Compute outputs - essential for accessing our application
output "instance_public_ip" {
  description = "The public IP address of our EC2 instance"
  value       = module.compute.public_ip
}

# output "instance_public_dns" {
#  description = "The public DNS name of our EC2 instance"
#  value       = module.compute.public_dns
#}

# Application access - makes it easy to access our application
#output "application_url" {
#  description = "URL where the application can be accessed"
#  value       = "http://${module.compute.public_dns}"
#}