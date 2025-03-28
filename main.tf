terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}
provider "aws" {
  region     = var.aws_region
}

resource "aws_instance" "app_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
   key_name      = "ec2-dev-key"
  tags = {
    Name    = "EC2_Testing"
    Purpose = "Creating EC2 for testing dev"
  }
  
  vpc_security_group_ids = [ aws_security_group.ec2-dev-test.id ]
}


resource "aws_security_group" "ec2-dev-test" {
  name="EC2-Dev-Security-group"
  description = "Allow SSH and test ports"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${var.ssh_ip}/32"]
  }
    ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
    egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
