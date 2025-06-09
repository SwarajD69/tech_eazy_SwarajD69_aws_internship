provider "aws" {
  region = "us-east-1"
}

# Security group to allow SSH and HTTP access
resource "aws_security_group" "allow_web_ssh" {
  name        = "allow_web_ssh"
  description = "Allow HTTP (80) and SSH (22)"
  vpc_id      = "vpc-0f174e7abf4e163f4"  # Replace with your actual VPC ID

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # For SSH
  }

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]  # For HTTP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "allow_web_ssh"
  }
}

# EC2 instance
resource "aws_instance" "my_instance" {
  ami                         = "ami-0731becbf832f281e"
  instance_type               = "t2.micro"
  key_name                    = "Terraform"             # Replace with your key pair name
  subnet_id                   = "subnet-0d87922344ef94247"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.allow_web_ssh.id]

  user_data = <<-EOF
              #!/bin/bash
              cd /home/ubuntu
              sudo apt-get update -y
              sudo apt install -y openjdk-21-jdk git
              git clone https://github.com/techeazy-consulting/techeazy-devops.git
              cd techeazy-devops/
              sudo chmod +x mvnw
              sudo ./mvnw clean install
              sudo nohup ./mvnw spring-boot:run > output.log 2>&1 &
              EOF


  tags = {
    Name        = "Terraform"
    Environment = "Internship"
    Owner       = "Swaraj"
    Project     = "TechEazy_Consulting_AWS_Internship"
  }
}

# Output the public IP of the instance
output "public_ip" {
  value       = aws_instance.my_instance.public_ip
  description = "Public IP of the EC2 instance"
}