resource "aws_vpc" "kiaasa_vpc_development" {
  cidr_block       = var.aws_vpc_cidr
  instance_tenancy = "default"
  tags = {
    Name      = "kiaasa-vpc-development"
    Terraform = "True"
  }
}