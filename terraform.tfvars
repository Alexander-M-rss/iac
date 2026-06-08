aws_region = "eu-west-1"
project_id = "cmtr-b56386db"

# Pre-existing networking resource names (resolved via data sources)
vpc_name            = "cmtr-b56386db-vpc"
public_subnet1_name = "cmtr-b56386db-public-subnet1"
public_subnet2_name = "cmtr-b56386db-public-subnet2"
sg_ssh_name         = "cmtr-b56386db-sg-ssh"
sg_http_name        = "cmtr-b56386db-sg-http"
sg_lb_name          = "cmtr-b56386db-sg-lb"

# New resource names
load_balancer_name         = "cmtr-b56386db-lb"
blue_target_group_name     = "cmtr-b56386db-blue-tg"
green_target_group_name    = "cmtr-b56386db-green-tg"
blue_asg_name              = "cmtr-b56386db-blue-asg"
green_asg_name             = "cmtr-b56386db-green-asg"
blue_launch_template_name  = "cmtr-b56386db-blue-template"
green_launch_template_name = "cmtr-b56386db-green-template"

# EC2 configuration
instance_type        = "t3.micro"
asg_min_size         = 1
asg_max_size         = 2
asg_desired_capacity = 1

# Traffic weights
blue_weight  = 100
green_weight = 0
