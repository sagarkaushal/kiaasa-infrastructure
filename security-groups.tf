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




