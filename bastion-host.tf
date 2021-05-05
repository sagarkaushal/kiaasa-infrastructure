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