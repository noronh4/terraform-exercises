resource "aws_autoscaling_group" "web_server_auto_staling_group" {
  vpc_zone_identifier = [aws_subnet.subnet_public_1.id, aws_subnet.subnet_public_2.id]
  desired_capacity   = 2
  min_size           = 2
  max_size           = 4
  target_group_arns  = [aws_lb_target_group.web_server.arn]

  launch_template {
    id      = aws_launch_template.web_server.id
    version = aws_launch_template.web_server.latest_version


  }

  depends_on = [aws_launch_template.web_server, aws_lb_target_group.web_server, aws_subnet.subnet_public_1, aws_subnet.subnet_public_2]
}