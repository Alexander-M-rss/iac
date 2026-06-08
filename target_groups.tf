resource "aws_lb_target_group" "blue" {
  name     = var.blue_target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.this.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = merge(local.common_tags, {
    Name = var.blue_target_group_name
  })
}

resource "aws_lb_target_group" "green" {
  name     = var.green_target_group_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = data.aws_vpc.this.id

  health_check {
    path                = "/"
    protocol            = "HTTP"
    matcher             = "200"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = merge(local.common_tags, {
    Name = var.green_target_group_name
  })
}
