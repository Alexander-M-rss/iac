output "iam_group_name" {
  description = "Name of the created IAM group"
  value       = aws_iam_group.this.name
}

output "iam_policy_arn" {
  description = "ARN of the created custom IAM policy"
  value       = aws_iam_policy.this.arn
}

output "iam_role_name" {
  description = "Name of the created IAM role"
  value       = aws_iam_role.this.name
}

output "iam_role_arn" {
  description = "ARN of the created IAM role"
  value       = aws_iam_role.this.arn
}

output "iam_instance_profile_name" {
  description = "Name of the created IAM instance profile"
  value       = aws_iam_instance_profile.this.name
}

output "iam_instance_profile_arn" {
  description = "ARN of the created IAM instance profile"
  value       = aws_iam_instance_profile.this.arn
}
