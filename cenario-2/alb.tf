resource "aws_lb" "web_server_application_load_balancer" {
  name               = "web-server"
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.allow_http_https_ssh.id]
  subnets            = [aws_subnet.subnet_public_1.id, aws_subnet.subnet_public_2.id]

  enable_deletion_protection = false

  tags = {
    Environment = "cenario_2"
  }

  depends_on = [aws_lb_target_group.web_server]
}

resource "aws_lb_listener" "web_server" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.web_server.arn
  }

  depends_on = [aws_lb.application_load_balancer]
}