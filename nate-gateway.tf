# CREATE ELASTIC IP ADDRESS FOR NAT GATEWAY
resource "aws_eip" "kiaasa-ngw-eip-1" {
}
resource "aws_eip" "kiaasa-ngw-eip-2" {
}


# CREATE NAT GATEWAY in EU-West-1A
resource "aws_nat_gateway" "kiaasa-ngw-1" {
  allocation_id = aws_eip.kiaasa-ngw-eip-1.id
  subnet_id     = aws_subnet.kiaasa_private-subnet-1a.id
  tags = {
    Name      = "kiaasa-ngw-1"
    Terraform = "True"
  }
}

resource "aws_nat_gateway" "kiaasa-ngw-2" {
  allocation_id = aws_eip.kiaasa-ngw-eip-2.id
  subnet_id     = aws_subnet.kiaasa_private-subnet-1b.id
  tags = {
    Name      = "kiaasa-ngw-2"
    Terraform = "True"
  }
}