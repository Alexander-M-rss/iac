locals {
  vpc_name              = var.vpc_name
  subnet1_name          = var.subnet1_name
  subnet2_name          = var.subnet2_name
  subnet3_name          = var.subnet3_name
  internet_gateway_name = var.internet_gateway_name
  routing_table_name    = var.routing_table_name
}

# VPC
resource "aws_vpc" "main" {
  cidr_block = var.vpc_cidr

  tags = {
    Name = local.vpc_name
  }
}

# Public subnets
resource "aws_subnet" "public_1" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet1_cidr
  availability_zone = var.availability_zone1

  tags = {
    Name = local.subnet1_name
  }
}

resource "aws_subnet" "public_2" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet2_cidr
  availability_zone = var.availability_zone2

  tags = {
    Name = local.subnet2_name
  }
}

resource "aws_subnet" "public_3" {
  vpc_id            = aws_vpc.main.id
  cidr_block        = var.subnet3_cidr
  availability_zone = var.availability_zone3

  tags = {
    Name = local.subnet3_name
  }
}

# Internet Gateway
resource "aws_internet_gateway" "main" {
  vpc_id = aws_vpc.main.id

  tags = {
    Name = local.internet_gateway_name
  }
}

# Public route table
resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main.id
  }

  tags = {
    Name = local.routing_table_name
  }
}

# Route table associations
resource "aws_route_table_association" "public_1" {
  subnet_id      = aws_subnet.public_1.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_2" {
  subnet_id      = aws_subnet.public_2.id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public_3" {
  subnet_id      = aws_subnet.public_3.id
  route_table_id = aws_route_table.public.id
}
