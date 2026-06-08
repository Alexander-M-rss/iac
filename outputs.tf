output "alb_dns_name" {
  description = "DNS name of the Application Load Balancer"
  value       = aws_lb.this.dns_name
}

output "alb_arn" {
  description = "ARN of the Application Load Balancer"
  value       = aws_lb.this.arn
}

output "blue_target_group_arn" {
  description = "ARN of the Blue target group"
  value       = aws_lb_target_group.blue.arn
}

output "green_target_group_arn" {
  description = "ARN of the Green target group"
  value       = aws_lb_target_group.green.arn
}

output "blue_launch_template_id" {
  description = "ID of the Blue launch template"
  value       = aws_launch_template.blue.id
}

output "green_launch_template_id" {
  description = "ID of the Green launch template"
  value       = aws_launch_template.green.id
}

output "blue_asg_name" {
  description = "Name of the Blue Auto Scaling group"
  value       = aws_autoscaling_group.blue.name
}

output "green_asg_name" {
  description = "Name of the Green Auto Scaling group"
  value       = aws_autoscaling_group.green.name
}
