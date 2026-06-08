provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./modules/network"

  project_id            = var.project_id
  vpc_name              = var.vpc_name
  vpc_cidr              = var.vpc_cidr
  internet_gateway_name = var.internet_gateway_name
  routing_table_name    = var.routing_table_name

  subnets = [
    {
      name              = var.subnet1_name
      cidr              = var.subnet1_cidr
      availability_zone = var.availability_zone1
    },
    {
      name              = var.subnet2_name
      cidr              = var.subnet2_cidr
      availability_zone = var.availability_zone2
    },
    {
      name              = var.subnet3_name
      cidr              = var.subnet3_cidr
      availability_zone = var.availability_zone3
    },
  ]
}

module "network_security" {
  source = "./modules/network_security"

  project_id                       = var.project_id
  vpc_id                           = module.network.vpc_id
  ssh_security_group_name          = var.ssh_security_group_name
  public_http_security_group_name  = var.public_http_security_group_name
  private_http_security_group_name = var.private_http_security_group_name
  allowed_ip_ranges                = var.allowed_ip_ranges
}

module "application" {
  source = "./modules/application"

  project_id                     = var.project_id
  vpc_id                         = module.network.vpc_id
  subnet_ids                     = module.network.subnet_ids_list
  launch_template_name           = var.aws_launch_template_name
  ami_id                         = var.ami_id
  ssh_security_group_id          = module.network_security.ssh_security_group_id
  private_http_security_group_id = module.network_security.private_http_security_group_id
  public_http_security_group_id  = module.network_security.public_http_security_group_id
  load_balancer_name             = var.load_balancer_name
  target_group_name              = var.target_group_name
  autoscaling_group_name         = var.autoscaling_group_name
  asg_desired_capacity           = var.asg_desired_capacity
  asg_min_size                   = var.asg_min_size
  asg_max_size                   = var.asg_max_size
}
