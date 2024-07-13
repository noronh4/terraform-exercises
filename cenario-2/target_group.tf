resource "aws_lb_target_group" "web_server" {
  name        = "alb-target-group-http"
  target_type = "instance"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id

  health_check {
    enabled  = true
    interval = 30
    path     = "/"
    port     = 80
    protocol = "HTTP"
  }

  depends_on = [aws_vpc.vpc]

  tags = {
    Env = "cenario_2"
  }
}
