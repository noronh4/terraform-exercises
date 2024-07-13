output "alb_dns" {
  value = aws_lb.web_server_application_load_balancer.dns_name
}