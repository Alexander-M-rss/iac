locals {
  keypair_name = "${var.project_id}-keypair"
}

resource "aws_key_pair" "this" {
  key_name   = local.keypair_name
  public_key = var.ssh_key

  tags = {
    Project = "epam-tf-lab"
    ID      = var.project_id
  }
}
