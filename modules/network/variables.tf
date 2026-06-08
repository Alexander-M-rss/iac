variable "project_id" {
  description = "Project ID used for resource tagging"
  type        = string
}

variable "vpc_name" {
  description = "Name of the VPC"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
}

variable "subnets" {
  description = "List of subnet definitions, each with name, cidr, and availability_zone"
  type = list(object({
    name              = string
    cidr              = string
    availability_zone = string
  }))
}

variable "internet_gateway_name" {
  description = "Name of the Internet Gateway"
  type        = string
}

variable "routing_table_name" {
  description = "Name of the route table for public subnets"
  type        = string
}
