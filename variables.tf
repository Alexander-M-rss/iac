variable "aws_region" {
  description = "AWS region where all resources will be created"
  type        = string
}

variable "project_id" {
  description = "Project ID used for tagging all resources"
  type        = string
}

# ─── Pre-existing resource names (looked up via data sources) ────────────────

variable "vpc_name" {
  description = "Name of the pre-existing VPC"
  type        = string
}

variable "public_subnet1_name" {
  description = "Name of the first pre-existing public subnet"
  type        = string
}

variable "public_subnet2_name" {
  description = "Name of the second pre-existing public subnet"
  type        = string
}

variable "sg_ssh_name" {
  description = "Name of the pre-existing security group for SSH access"
  type        = string
}

variable "sg_http_name" {
  description = "Name of the pre-existing security group for HTTP access to EC2 instances"
  type        = string
}

variable "sg_lb_name" {
  description = "Name of the pre-existing security group for HTTP access to the load balancer"
  type        = string
}

# ─── New resource names ──────────────────────────────────────────────────────

variable "load_balancer_name" {
  description = "Name of the Application Load Balancer"
  type        = string
}

variable "blue_target_group_name" {
  description = "Name of the Blue target group"
  type        = string
}

variable "green_target_group_name" {
  description = "Name of the Green target group"
  type        = string
}

variable "blue_asg_name" {
  description = "Name of the Blue Auto Scaling group"
  type        = string
}

variable "green_asg_name" {
  description = "Name of the Green Auto Scaling group"
  type        = string
}

variable "blue_launch_template_name" {
  description = "Name of the Blue launch template"
  type        = string
}

variable "green_launch_template_name" {
  description = "Name of the Green launch template"
  type        = string
}

# ─── EC2 configuration ───────────────────────────────────────────────────────

variable "instance_type" {
  description = "EC2 instance type for Blue and Green environments"
  type        = string
}

variable "asg_min_size" {
  description = "Minimum number of instances in each Auto Scaling group"
  type        = number
}

variable "asg_max_size" {
  description = "Maximum number of instances in each Auto Scaling group"
  type        = number
}

variable "asg_desired_capacity" {
  description = "Desired number of instances in each Auto Scaling group"
  type        = number
}

# ─── Traffic weights ─────────────────────────────────────────────────────────

variable "blue_weight" {
  description = "Traffic weight assigned to the Blue target group (0-100)"
  type        = number
}

variable "green_weight" {
  description = "Traffic weight assigned to the Green target group (0-100)"
  type        = number
}
