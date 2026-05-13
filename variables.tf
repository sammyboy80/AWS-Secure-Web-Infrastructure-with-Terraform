variable "project_name" {
  description = "Project name"
  type        = string
}

variable "environment" {
  description = "Environment name"
  type        = string
}

variable "aws_region" {
  description = "AWS region"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for VPC"
  type        = string
}

variable "public_subnet_cidr" {
  description = "CIDR block for public subnet"
  type        = string
}

variable "private_subnet_cidr" {
  description = "CIDR block for private subnet"
  type        = string
}

variable "bucket_name" {
  description = "S3 bucket name"
  type        = string
}

variable "key_name" {
  description = "EC2 SSH key pair name"
  type        = string
  default     = "my-key"
}

variable "db_password" {
  description = "Database password"
  type        = string
  sensitive   = true
}


variable "public_subnet_2_cidr" {
  description = "CIDR block for second public subnet"
  type        = string
}

variable "private_subnet_2_cidr" {
  description = "CIDR block for second private subnet"
  type        = string
}


variable "alert_email" {
  description = "Email address for alerts"
  type        = string
}
