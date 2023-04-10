resource "aws_launch_configuration" "rails" {
  name_prefix = "rails-lc-"
  image_id    = "ami-0123456789abcdef"
  instance_type = "t3.micro"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "rails" {
  name = "rails-asg"

  launch_configuration = aws_launch_configuration.rails.name
  vpc_zone_identifier  = [aws_subnet.private.*.id]

  min_size = 2
  max_size = 5
  desired_capacity = 2

  tag {
    key                 = "Name"
    value               = "Rails Autoscaling Group"
    propagate_at_launch = true
  }
}
