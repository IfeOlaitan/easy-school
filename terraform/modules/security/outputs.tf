output "security_group_id" {
  description = "ID of the security group"
  value       = aws_security_group.app.id
}

output "instance_profile_name" {
  description = "Name of the IAM instance profile for EC2"
  value       = aws_iam_instance_profile.ec2_profile.name
}