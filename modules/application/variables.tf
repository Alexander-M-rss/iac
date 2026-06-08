variable "project_id" {
  description = "Project ID used for resource tagging"
  type        = string
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the ASG and ALB"
  type        = list(string)
}

variable "launch_template_name" {
  description = "Name of the EC2 launch template"
  type        = string
}

variable "ami_id" {
  description = "AMI ID to use for EC2 instances"
  type        = string
}

variable "ssh_security_group_id" {
  description = "ID of the SSH security group to attach to instances"
  type        = string
}

variable "private_http_security_group_id" {
  description = "ID of the private HTTP security group to attach to instances"
  type        = string
}

variable "public_http_security_group_id" {
  description = "ID of the public HTTP security group to attach to the ALB"
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
