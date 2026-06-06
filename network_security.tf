locals {
  common_tags = {
    Project = var.project_id
  }
}

# ── Look up existing instances to get their primary ENI IDs ──────────────────

data "aws_instance" "public" {
  instance_id = var.public_instance_id
}

data "aws_instance" "private" {
  instance_id = var.private_instance_id
}

# ── SSH Security Group ────────────────────────────────────────────────────────

resource "aws_security_group" "ssh" {
  name        = var.ssh_security_group_name
  description = "Allow SSH and ICMP from allowed IP ranges"
  vpc_id      = var.vpc_id

  tags = local.common_tags
}

resource "aws_security_group_rule" "ssh_ingress_ssh" {
  security_group_id = aws_security_group.ssh.id
  type              = "ingress"
  description       = "Allow SSH from allowed IP ranges"
  protocol          = "tcp"
  from_port         = 22
  to_port           = 22
  cidr_blocks       = var.allowed_ip_range
}

resource "aws_security_group_rule" "ssh_ingress_icmp" {
  security_group_id = aws_security_group.ssh.id
  type              = "ingress"
  description       = "Allow ICMP from allowed IP ranges"
  protocol          = "icmp"
  from_port         = -1
  to_port           = -1
  cidr_blocks       = var.allowed_ip_range
}

# ── Public HTTP Security Group ────────────────────────────────────────────────

resource "aws_security_group" "public_http" {
  name        = var.public_http_security_group_name
  description = "Allow HTTP and ICMP from allowed IP ranges"
  vpc_id      = var.vpc_id

  tags = local.common_tags
}

resource "aws_security_group_rule" "public_http_ingress_http" {
  security_group_id = aws_security_group.public_http.id
  type              = "ingress"
  description       = "Allow HTTP from allowed IP ranges"
  protocol          = "tcp"
  from_port         = 80
  to_port           = 80
  cidr_blocks       = var.allowed_ip_range
}

resource "aws_security_group_rule" "public_http_ingress_icmp" {
  security_group_id = aws_security_group.public_http.id
  type              = "ingress"
  description       = "Allow ICMP from allowed IP ranges"
  protocol          = "icmp"
  from_port         = -1
  to_port           = -1
  cidr_blocks       = var.allowed_ip_range
}

# ── Private HTTP Security Group ───────────────────────────────────────────────

resource "aws_security_group" "private_http" {
  name        = var.private_http_security_group_name
  description = "Allow HTTP 8080 and ICMP only from the public HTTP security group"
  vpc_id      = var.vpc_id

  tags = local.common_tags
}

resource "aws_security_group_rule" "private_http_ingress_http" {
  security_group_id        = aws_security_group.private_http.id
  type                     = "ingress"
  description              = "Allow HTTP 8080 from public HTTP security group"
  protocol                 = "tcp"
  from_port                = 8080
  to_port                  = 8080
  source_security_group_id = aws_security_group.public_http.id
}

resource "aws_security_group_rule" "private_http_ingress_icmp" {
  security_group_id        = aws_security_group.private_http.id
  type                     = "ingress"
  description              = "Allow ICMP from public HTTP security group"
  protocol                 = "icmp"
  from_port                = -1
  to_port                  = -1
  source_security_group_id = aws_security_group.public_http.id
}

# ── Security Group Attachments ────────────────────────────────────────────────

resource "aws_network_interface_sg_attachment" "public_instance_ssh" {
  security_group_id    = aws_security_group.ssh.id
  network_interface_id = data.aws_instance.public.network_interface_id
}

resource "aws_network_interface_sg_attachment" "public_instance_http" {
  security_group_id    = aws_security_group.public_http.id
  network_interface_id = data.aws_instance.public.network_interface_id
}

resource "aws_network_interface_sg_attachment" "private_instance_ssh" {
  security_group_id    = aws_security_group.ssh.id
  network_interface_id = data.aws_instance.private.network_interface_id
}

resource "aws_network_interface_sg_attachment" "private_instance_http" {
  security_group_id    = aws_security_group.private_http.id
  network_interface_id = data.aws_instance.private.network_interface_id
}
