# Resolves the latest Amazon Linux 2023 AMI for the current region.
# Python 3 is included out of the box on AL2023.
data "aws_ssm_parameter" "al2023_ami" {
  name = "/aws/service/ami-amazon-linux-latest/al2023-ami-kernel-default-x86_64"
}

# ─── Pre-existing networking resources ───────────────────────────────────────

data "aws_vpc" "this" {
  filter {
    name   = "tag:Name"
    values = [var.vpc_name]
  }
}

data "aws_subnet" "public1" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet1_name]
  }
}

data "aws_subnet" "public2" {
  filter {
    name   = "tag:Name"
    values = [var.public_subnet2_name]
  }
}

data "aws_security_group" "ssh" {
  filter {
    name   = "group-name"
    values = [var.sg_ssh_name]
  }
}

data "aws_security_group" "http" {
  filter {
    name   = "group-name"
    values = [var.sg_http_name]
  }
}

data "aws_security_group" "lb" {
  filter {
    name   = "group-name"
    values = [var.sg_lb_name]
  }
}
