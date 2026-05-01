resource "aws_launch_template" "lt" {
  name_prefix   = "app-lt"
  image_id      = var.ami
  instance_type = var.instance_type
}

resource "aws_autoscaling_group" "asg" {
  desired_capacity    = 2
  max_size            = 3
  min_size            = 1
  vpc_zone_identifier = var.subnets

  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }

  target_group_arns = [var.target_group_arn]
}
