#Create Public Subnet
#ap-south-1a
#ap-soutn-1b

resource "aws_subnet" "kiaasa_public-subnet-1a" {
  vpc_id                  = aws_vpc.kiaasa_vpc_development.id
  cidr_block              = var.kiaasa_public-subnet-1a-cidr
  availability_zone       = var.availability_zone-1a
  map_public_ip_on_launch = "true"
  tags = {
    Name      = "kiaasa-public-subnet-1a"
    Terraform = "True"
  }
}


resource "aws_subnet" "kiaasa_public-subnet-1b" {
  vpc_id                  = aws_vpc.kiaasa_vpc_development.id
  cidr_block              = var.kiaasa_public-subnet-1b-cidr
  availability_zone       = var.availability_zone-1b
  map_public_ip_on_launch = "true"
  tags = {
    Name      = "kiaasa-public-subnet-1b"
    Terraform = "True"
  }
}






#Create Private Subnet
#ap-south-1a
#ap-south-1b

resource "aws_subnet" "kiaasa_private-subnet-1a" {
  vpc_id                  = aws_vpc.kiaasa_vpc_development.id
  cidr_block              = var.kiaasa_private-subnet-1a-cidr
  availability_zone       = var.availability_zone-1a
  map_public_ip_on_launch = "false"
  tags = {
    Name      = "kiaasa-private-subnet-1a"
    Terraform = "True"
  }
}


resource "aws_subnet" "kiaasa_private-subnet-1b" {
  vpc_id                  = aws_vpc.kiaasa_vpc_development.id
  cidr_block              = var.kiaasa_private-subnet-1b-cidr
  availability_zone       = var.availability_zone-1b
  map_public_ip_on_launch = "false"
  tags = {
    Name      = "kiaasa-private-subnet-1b"
    Terraform = "True"
  }
}
