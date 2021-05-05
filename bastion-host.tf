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


resource "aws_instance" "kiaasa-development-bastion-host-1a" {
  ami                         = var.kiaasa-development-bastion-host-ami
  key_name                    = "kiaasa-development"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.kiaasa-bastion-host-development-sg.id]
  subnet_id                   = aws_subnet.kiaasa_development_public-subnet-1a.id
  tags = {
    Name      = "kiaasa-development-bastion-host-1a"
    Terraform = "True"
  }

}


resource "aws_instance" "kiaasa-development-bastion-host-1b" {
  ami                         = var.kiaasa-development-bastion-host-ami
  key_name                    = "kiaasa-development"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.kiaasa-bastion-host-development-sg.id]
  subnet_id                   = aws_subnet.kiaasa_development_public-subnet-1b.id
  tags = {
    Name      = "kiaasa-development-bastion-host-1b"
    Terraform = "True"
  }

}