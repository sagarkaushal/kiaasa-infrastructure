resource "aws_lb" "kiaasa-development-load-balancer" {
  name                       = "kiaasa-development-load-balancer"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.kiaasa-alb-development-sg.id]
  subnets                    = [aws_subnet.kiaasa_development_public-subnet-1a.id, aws_subnet.kiaasa_development_public-subnet-1b.id]
  enable_deletion_protection = false
  tags = {
    Name      = "kiaasa-development-load-balancer"
    Terraform = "True"
  }
}