# Create ALB Listner - HTTPS

resource "aws_lb_listener" "kiaasa-development-alb-listener-https" {
  load_balancer_arn = aws_lb.kiaasa-development-load-balancer.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-TLS-1-0-2015-04"
  certificate_arn   = var.development-certificate-arn
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.kiaasa-development-frontend-target-group.arn
  }
}


resource "aws_lb_listener_rule" "kiaasa-development-back-office" {
  listener_arn = aws_lb_listener.kiaasa-development-alb-listener-https.arn
  priority     = 100
  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.kiaasa-development-backend-target-group.arn

  }
  condition {
    path_pattern {
      values = ["/admin*"]
    }
  }
}