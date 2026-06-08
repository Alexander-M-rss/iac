variable "project_id" {
  description = "Project ID used for resource tagging"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC in which to create the security groups"
  type        = string
}

variable "ssh_security_group_name" {
  description = "Name of the SSH security group"
  type        = string
}

variable "public_http_security_group_name" {
  description = "Name of the public HTTP security group (ALB-facing)"
  type        = string
}

variable "private_http_security_group_name" {
  description = "Name of the private HTTP security group (EC2-facing)"
  type        = string
}

variable "allowed_ip_ranges" {
  description = "List of CIDR ranges allowed to access SSH and public HTTP (e.g. platform IP and your public IP)"
  type        = list(string)
}
