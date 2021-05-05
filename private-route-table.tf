resource "aws_route_table" "kiaasa-development-private-rt-1a" {
  vpc_id = aws_vpc.kiaasa_vpc_development.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.kiaasa-development-ngw-1.id

  }
  tags = {
    Name      = "kiaasa-development-private-rt-1a"
    Terraform = "True"
  }
}

resource "aws_route_table_association" "kiaasa-development-rt-ass-1a" {
  subnet_id      = aws_subnet.kiaasa_development_private-subnet-1a.id
  route_table_id = aws_route_table.kiaasa-development-private-rt-1a.id
}




resource "aws_route_table" "kiaasa-development-private-rt-1b" {
  vpc_id = aws_vpc.kiaasa_vpc_development.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.kiaasa-development-ngw-2.id

  }
  tags = {
    Name      = "kiaasa-development-private-rt-1b"
    Terraform = "True"
  }
}


resource "aws_route_table_association" "kiaasa-development-rt-ass-1b" {
  subnet_id      = aws_subnet.kiaasa_development_private-subnet-1b.id
  route_table_id = aws_route_table.kiaasa-development-private-rt-1b.id
}