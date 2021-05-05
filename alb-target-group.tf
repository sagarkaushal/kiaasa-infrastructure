#Create front-end target group

resource "aws_lb_target_group" "kiaasa-development-frontend-target-group" {
  port     = 80
  protocol = "HTTP"
  name     = "kiaasa-development-frontend-tg"
  vpc_id   = aws_vpc.kiaasa_vpc_development.id
  stickiness {
    type    = "lb_cookie"
    enabled = true
  }
  health_check {
    protocol            = "HTTP"
    path                = "/healthy.html"
    unhealthy_threshold = 2
    healthy_threshold   = 2
    timeout             = 5
    interval            = 10
  }
  tags = {
    Name      = "kiaasa-development-frontend-target-group"
    Terraform = "True"
  }
}







resource "aws_lb_target_group" "kiaasa-development-backend-target-group" {
  port     = 80
  protocol = "HTTP"
  name     = "kiaasa-development-backend-tg"
  vpc_id   = aws_vpc.kiaasa_vpc_development.id
  stickiness {
    type    = "lb_cookie"
    enabled = true
  }
  health_check {
    protocol            = "HTTP"
    path                = "/healthy.html"
    unhealthy_threshold = 2
    healthy_threshold   = 2
    timeout             = 5
    interval            = 10
  }
  tags = {
    Name      = "kiaasa-development-backend-target-group"
    Terraform = "True"
  }
}