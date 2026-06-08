variable "aws_region" {
  description = "AWS region where all resources will be created"
  type        = string
}

variable "project_id" {
  description = "Project ID applied as a tag on all resources"
  type        = string
}

# --- Network ---

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnet1_name" {
  description = "Name of the first subnet"
  type        = string
}

variable "subnet1_cidr" {
  description = "CIDR block for the first subnet"
  type        = string
}

variable "availability_zone1" {
  description = "Availability zone for the first subnet"
  type        = string
}

variable "subnet2_name" {
  description = "Name of the second subnet"
  type        = string
}

variable "subnet2_cidr" {
  description = "CIDR block for the second subnet"
  type        = string
}

variable "availability_zone2" {
  description = "Availability zone for the second subnet"
  type        = string
}

variable "subnet3_name" {
  description = "Name of the third subnet"
  type        = string
}

variable "subnet3_cidr" {
  description = "CIDR block for the third subnet"
  type        = string
}

variable "availability_zone3" {
  description = "Availability zone for the third subnet"
  type        = string
}

variable "internet_gateway_name" {
  description = "Name of the Internet Gateway"
  type        = string
}

variable "routing_table_name" {
  description = "Name of the route table for public subnets"
  type        = string
}

# --- Network Security ---

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
  description = "List of CIDR ranges allowed to access SSH and HTTP (platform IP and your public IP)"
  type        = list(string)
}

# --- Application ---

variable "aws_launch_template_name" {
  description = "Name of the EC2 launch template"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for EC2 instances (Amazon Linux 2 recommended)"
  type        = string
}

variable "load_balancer_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "target_group_name" {
  description = "Name of the ALB target group"
  type        = string
}

variable "autoscaling_group_name" {
  description = "Name of the Auto Scaling group"
  type        = string
}

variable "asg_desired_capacity" {
  description = "Desired number of instances in the Auto Scaling group"
  type        = number
}

variable "asg_min_size" {
  description = "Minimum number of instances in the Auto Scaling group"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum number of instances in the Auto Scaling group"
  type        = number
}
