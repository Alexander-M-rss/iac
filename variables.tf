variable "aws_region" {
  description = "AWS region where all resources will be created"
  type        = string
}

variable "vpc_id" {
  description = "ID of the pre-existing VPC"
  type        = string
}

variable "public_subnet_id" {
  description = "ID of the pre-existing public subnet"
  type        = string
}

variable "private_subnet_id" {
  description = "ID of the pre-existing private subnet"
  type        = string
}

variable "public_instance_id" {
  description = "ID of the pre-existing public EC2 instance"
  type        = string
}

variable "private_instance_id" {
  description = "ID of the pre-existing private EC2 instance"
  type        = string
}

variable "ssh_security_group_name" {
  description = "Name for the SSH security group"
  type        = string
}

variable "public_http_security_group_name" {
  description = "Name for the public HTTP security group"
  type        = string
}

variable "private_http_security_group_name" {
  description = "Name for the private HTTP security group"
  type        = string
}

variable "project_id" {
  description = "Project ID used for tagging resources"
  type        = string
}

variable "allowed_ip_range" {
  description = "List of IP CIDR ranges allowed to access the infrastructure"
  type        = list(string)
}
