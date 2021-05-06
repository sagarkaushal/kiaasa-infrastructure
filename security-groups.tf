resource "aws_security_group" "kiaasa-bastion-host-development-sg" {
  vpc_id      = aws_vpc.kiaasa_vpc_development.id
  description = "Kiaasa development bastion host security group"
  ingress {
    description = "Allow Port 22"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IP and Ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "kiaasa-bastion-host-development-sg"
    Terraform = "True"
  }
}

resource "aws_security_group" "kiaasa-alb-development-sg" {
  vpc_id      = aws_vpc.kiaasa_vpc_development.id
  description = "Kiaasa development alb security group"
  ingress {
    description = "Allow Port 443"
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    description = "Allow all IP and Ports outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name      = "kiaasa-alb-development-sg"
    Terraform = "True"
  }
}




resource "aws_security_group" "kiaasa-development-asg-sg" {
  vpc_id      = aws_vpc.kiaasa_vpc_development.id
  description = "kiaasa-development-asg-sg"
  egress {
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    security_groups = [
      aws_security_group.kiaasa-alb-development-sg.id
    ]
  }
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    security_groups = [
      aws_security_group.kiaasa-bastion-host-development-sg.id
    ]
  }

  tags = {
    Name      = "kiaasa-development-asg-sg"
    Terraform = "True"
  }
}