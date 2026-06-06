variable "aws_region" {
  description = "AWS region where resources will be created."
  type        = string
}

variable "project_id" {
  description = "Unique project identifier used for tagging resources."
  type        = string
}

variable "bucket_name" {
  description = "Globally unique name for the S3 bucket."
  type        = string
}
