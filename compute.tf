locals {
  instance_name = var.ec2_instance_name
}

resource "aws_instance" "main" {
  ami                    = data.aws_ami.amazon_linux_2023.id
  instance_type          = "t3.micro"
  subnet_id              = data.aws_subnet.public.id
  vpc_security_group_ids = [data.aws_security_group.main.id]

  tags = {
    Name      = local.instance_name
    Terraform = "true"
    Project   = var.project_id
  }
}
