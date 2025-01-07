resource "aws_instance" "app" {
  ami                  = var.ami_id
  instance_type        = var.instance_type
  subnet_id            = var.subnet_id
  key_name             = var.key_pair
  iam_instance_profile = var.instance_profile_name

  vpc_security_group_ids = [var.security_group_id]

  user_data = <<-EOF
              #!/bin/bash
              yum update -y
              yum install -y docker
              systemctl start docker
              systemctl enable docker
              docker pull ${var.docker_image}
              docker run -d -p 80:8000 ${var.docker_image}
              EOF

  tags = {
    Name = "easy-school-instance"
  }
}