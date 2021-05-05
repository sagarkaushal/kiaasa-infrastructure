resource "aws_internet_gateway" "kiaasa_development_igw" {
vpc_id = aws_vpc.kiaasa_vpc_development.id
tags = {
    Name = "kiaasa-development-igw"
    Terraform = "True"
}

}