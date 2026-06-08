# General
aws_region = "eu-west-1"
project_id = "cmtr-b56386db"

# Network
vpc_name              = "cmtr-b56386db-vpc"
vpc_cidr              = "10.10.0.0/16"
subnet1_name          = "cmtr-b56386db-subnet-public-a"
subnet1_cidr          = "10.10.1.0/24"
availability_zone1    = "eu-west-1a"
subnet2_name          = "cmtr-b56386db-subnet-public-b"
subnet2_cidr          = "10.10.3.0/24"
availability_zone2    = "eu-west-1b"
subnet3_name          = "cmtr-b56386db-subnet-public-c"
subnet3_cidr          = "10.10.5.0/24"
availability_zone3    = "eu-west-1c"
internet_gateway_name = "cmtr-b56386db-igw"
routing_table_name    = "cmtr-b56386db-rt"

# Network Security
ssh_security_group_name          = "cmtr-b56386db-ssh-sg"
public_http_security_group_name  = "cmtr-b56386db-public-http-sg"
private_http_security_group_name = "cmtr-b56386db-private-http-sg"
# 18.153.146.156 = platform IP; replace YOUR_PUBLIC_IP with your actual public IP
allowed_ip_ranges = ["18.153.146.156/32", "192.42.116.102/32"]

# Application
aws_launch_template_name = "cmtr-b56386db-template"
# Amazon Linux 2023 AMI for eu-west-1
ami_id                 = "ami-0fed63ea358539e44"
load_balancer_name     = "cmtr-b56386db-lb"
target_group_name      = "cmtr-b56386db-tg"
autoscaling_group_name = "cmtr-b56386db-asg"
asg_desired_capacity   = 2
asg_min_size           = 2
asg_max_size           = 2
