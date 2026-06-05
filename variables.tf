variable "aws_region" {
  description = "AWS region where resources will be created."
  type        = string
}

variable "project_id" {
  description = "Unique project identifier used for tagging and naming resources."
  type        = string
}

variable "vpc_name" {
  description = "Name of the existing VPC to look up via data source."
  type        = string
}

variable "security_group_name" {
  description = "Name of the existing security group that allows SSH access."
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type."
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use for the EC2 instance."
  type        = string
}

variable "ssh_key" {
  description = "Provides custom public SSH key."
  type        = string
}
