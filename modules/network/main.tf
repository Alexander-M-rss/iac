locals {
  tags = {
    Terraform = "true"
    Project   = var.project_id
  }
}

resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr

  tags = merge(local.tags, {
    Name = var.vpc_name
  })
}

resource "aws_subnet" "subnets" {
  for_each = { for s in var.subnets : s.name => s }

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value.cidr
  availability_zone = each.value.availability_zone

  tags = merge(local.tags, {
    Name = each.value.name
  })
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = merge(local.tags, {
    Name = var.internet_gateway_name
  })
}

resource "aws_route_table" "this" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = merge(local.tags, {
    Name = var.routing_table_name
  })
}

resource "aws_route_table_association" "subnets" {
  for_each = aws_subnet.subnets

  subnet_id      = each.value.id
  route_table_id = aws_route_table.this.id
}
