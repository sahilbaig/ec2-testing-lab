variable "aws_region" {
  description = "AWS Region"
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI Id value"
  default     = "ami-084568db4383264d4"
}

variable "instance_type" {
  description = "Instance type of EC2"
  default     = "t2.micro"
}

variable "aws_secret_key" {
  description = "AWS Secret key"
  default     = ""
}

variable "aws_access_key" {
  description = "AWS Access Key"
  default     = ""
}

variable "ssh_ip" {
  description = "My IP to SSH"
  type        = string
}


variable "environment" {
  type    = string
  default = "local"  # Default for local execution
}

variable "aws_role_arn" {
  type    = string
  default = "" # This is only used in GitHub Actions
}

