output "vpc_id" {
  description = "ID of the created VPC"
  value       = aws_vpc.this.id
}

output "subnet_ids" {
  description = "Map of subnet name to subnet ID"
  value       = { for k, v in aws_subnet.subnets : k => v.id }
}

output "subnet_ids_list" {
  description = "List of subnet IDs"
  value       = [for v in aws_subnet.subnets : v.id]
}
