aws_region = "eu-west-1"

vpc_id            = "vpc-0496a52a49d44e021"
public_subnet_id  = "subnet-053657b07c1ec2453"
private_subnet_id = "subnet-0147b2598968b5220"

public_instance_id  = "i-06b1e4438c5cd3f3e"
private_instance_id = "i-02d7a0dba9004525a"

ssh_security_group_name          = "cmtr-b56386db-ssh-sg"
public_http_security_group_name  = "cmtr-b56386db-public-http-sg"
private_http_security_group_name = "cmtr-b56386db-private-http-sg"

project_id = "cmtr-b56386db"

allowed_ip_range = ["18.153.146.156/32", "185.100.87.166/32"]
