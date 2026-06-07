variable "aws_region" {
  description = "AWS region where all resources will be created"
  type        = string
}

variable "project_id" {
  description = "Project identifier used for tagging all resources and looking up pre-created resources"
  type        = string
}

variable "aws_launch_template_name" {
  description = "Name of the EC2 Launch Template to create"
  type        = string
}

variable "aws_asg_name" {
  description = "Name of the Auto Scaling Group to create"
  type        = string
}

variable "load_balancer_name" {
  description = "Name of the Application Load Balancer to create"
  type        = string
}
