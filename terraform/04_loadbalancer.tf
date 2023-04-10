resource "aws_lb" "rails" {
  name               = "rails-elb"
  internal           = false
  load_balancer_type = "application"
  subnets            = [aws_subnet.public.*.id]

  tags = {
    Name = "Rails ELB"
  }
}

resource "aws_lb_target_group" "rails" {
  name_prefix      = "rails-tg"
  port             = 80
  protocol         = "HTTP"
  target_type      = "instance"
  vpc_id           = aws_vpc.main.id

  health_check {
    path     = "/"
    interval = 30
    timeout  = 5
  }
}

resource "aws_lb_listener" "rails" {
  load_balancer_arn = aws_lb.rails.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.rails.arn
  }
}

resource "aws_lb_listener_rule" "rails" {
  listener_arn = aws_lb_listener.rails.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.rails.arn
  }

  condition {
    path_pattern {
      values = ["/"]
    }
  }
}

