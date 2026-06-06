variable "aws_region" {
  description = "AWS region where resources will be created"
  type        = string
}

variable "project_id" {
  description = "Project identifier used as the value for the Project tag"
  type        = string
}

variable "bucket_name" {
  description = "Name of the pre-created S3 bucket to which the IAM policy will grant write access"
  type        = string
}

variable "iam_group_name" {
  description = "Name of the IAM group to create"
  type        = string
}

variable "iam_policy_name" {
  description = "Name of the custom IAM policy to create"
  type        = string
}

variable "iam_role_name" {
  description = "Name of the IAM role to create for EC2"
  type        = string
}

variable "iam_instance_profile_name" {
  description = "Name of the IAM instance profile to create and associate with the IAM role"
  type        = string
}
