# CREATE ELASTIC IP ADDRESS FOR NAT GATEWAY
resource "aws_eip" "kiaasa-development-ngw-eip-1" {
  tags = {
    Name      = "kiaasa-development-ngw-eip-1"
    Terraform = "True"
  }
}
resource "aws_eip" "kiaasa-development-ngw-eip-2" {
  tags = {
    Name      = "kiaasa-development-ngw-eip-2"
    Terraform = "True"
  }
}


# CREATE NAT GATEWAY in EU-West-1A
resource "aws_nat_gateway" "kiaasa-development-ngw-1" {
  allocation_id = aws_eip.kiaasa-development-ngw-eip-1.id
  subnet_id     = aws_subnet.kiaasa_development_private-subnet-1a.id
  tags = {
    Name      = "kiaasa-development-ngw-1"
    Terraform = "True"
  }
}

resource "aws_nat_gateway" "kiaasa-development-ngw-2" {
  allocation_id = aws_eip.kiaasa-development-ngw-eip-2.id
  subnet_id     = aws_subnet.kiaasa_development_private-subnet-1b.id
  tags = {
    Name      = "kiaasa-development-ngw-2"
    Terraform = "True"
  }
}