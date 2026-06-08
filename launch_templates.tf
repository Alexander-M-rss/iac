resource "aws_launch_template" "blue" {
  name          = var.blue_launch_template_name
  image_id      = data.aws_ssm_parameter.al2023_ami.value
  instance_type = var.instance_type

  vpc_security_group_ids = [data.aws_security_group.ssh.id, data.aws_security_group.http.id]

  user_data = base64encode(local.blue_user_data)

  tag_specifications {
    resource_type = "instance"
    tags = merge(local.common_tags, {
      Name = var.blue_launch_template_name
    })
  }

  tag_specifications {
    resource_type = "volume"
    tags = merge(local.common_tags, {
      Name = var.blue_launch_template_name
    })
  }

  tags = merge(local.common_tags, {
    Name = var.blue_launch_template_name
  })
}

resource "aws_launch_template" "green" {
  name          = var.green_launch_template_name
  image_id      = data.aws_ssm_parameter.al2023_ami.value
  instance_type = var.instance_type

  vpc_security_group_ids = [data.aws_security_group.ssh.id, data.aws_security_group.http.id]

  user_data = base64encode(local.green_user_data)

  tag_specifications {
    resource_type = "instance"
    tags = merge(local.common_tags, {
      Name = var.green_launch_template_name
    })
  }

  tag_specifications {
    resource_type = "volume"
    tags = merge(local.common_tags, {
      Name = var.green_launch_template_name
    })
  }

  tags = merge(local.common_tags, {
    Name = var.green_launch_template_name
  })
}
