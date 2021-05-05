resource "aws_route_table" "kiaasa-development-public-rt-1a" {
  vpc_id = aws_vpc.kiaasa_vpc_development.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kiaasa_development_igw.id

  }
  tags = {
    Name      = "kiaasa-development-public-rt-1a"
    Terraform = "True"
  }
}

resource "aws_route_table_association" "kiaasa-development-public-rt-ass-1a" {
  subnet_id      = aws_subnet.kiaasa_development_public-subnet-1a.id
  route_table_id = aws_route_table.kiaasa-development-public-rt-1a.id
}




resource "aws_route_table" "kiaasa-development-public-rt-1b" {
  vpc_id = aws_vpc.kiaasa_vpc_development.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.kiaasa_development_igw.id

  }
  tags = {
    Name      = "kiaasa-development-public-rt-1b"
    Terraform = "True"
  }
}


resource "aws_route_table_association" "kiaasa-development-public-rt-ass-1b" {
  subnet_id      = aws_subnet.kiaasa_development_public-subnet-1b.id
  route_table_id = aws_route_table.kiaasa-development-public-rt-1b.id
}