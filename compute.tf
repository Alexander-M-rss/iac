locals {
  instance_name = "${var.project_id}-ec2"
}

resource "aws_instance" "this" {
  ami                    = data.aws_ami.amazon_linux_2.id
  instance_type          = "t3.micro"
  subnet_id              = data.terraform_remote_state.base_infra.outputs.public_subnet_id
  vpc_security_group_ids = [data.terraform_remote_state.base_infra.outputs.security_group_id]

  tags = {
    Name      = local.instance_name
    Terraform = "true"
    Project   = var.project_id
  }
}
