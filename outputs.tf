output "instance_id" {
  description = "The ID of the created EC2 instance"
  value       = aws_instance.main.id
}

output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.main.public_ip
}

output "ami_id" {
  description = "The AMI ID used for the EC2 instance"
  value       = data.aws_ami.amazon_linux_2023.id
}
