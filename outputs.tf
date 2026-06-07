output "vpc_id" {
  description = "The ID of the VPC"
  value       = aws_vpc.main.id
}

output "vpc_cidr" {
  description = "The CIDR block of the VPC"
  value       = aws_vpc.main.cidr_block
}

output "public_subnet_ids" {
  description = "The IDs of all public subnets"
  value = [
    aws_subnet.public_1.id,
    aws_subnet.public_2.id,
    aws_subnet.public_3.id,
  ]
}

output "public_subnet_cidr_block" {
  description = "The CIDR blocks of all public subnets"
  value = [
    aws_subnet.public_1.cidr_block,
    aws_subnet.public_2.cidr_block,
    aws_subnet.public_3.cidr_block,
  ]
}

output "public_subnet_availability_zone" {
  description = "The Availability Zones of all public subnets"
  value = [
    aws_subnet.public_1.availability_zone,
    aws_subnet.public_2.availability_zone,
    aws_subnet.public_3.availability_zone,
  ]
}

output "internet_gateway_id" {
  description = "The ID of the Internet Gateway"
  value       = aws_internet_gateway.main.id
}

output "routing_table_id" {
  description = "The ID of the route table"
  value       = aws_route_table.public.id
}
