variable "aws_vpc_cidr" {
  type    = string
  default = "10.0.0.0/16"
}

variable "aws_region" {
  type    = string
  default = "ap-south-1"
}

variable "kiaasa_development_public-subnet-1a-cidr" {
  type    = string
  default = "10.0.1.0/24"
}

variable "kiaasa_development_public-subnet-1b-cidr" {
  type    = string
  default = "10.0.2.0/24"
}

variable "kiaasa_development_private-subnet-1a-cidr" {
  type    = string
  default = "10.0.3.0/24"
}

variable "kiaasa_development_private-subnet-1b-cidr" {
  type    = string
  default = "10.0.4.0/24"
}


variable "availability_zone-1a" {
  type    = string
  default = "ap-south-1a"
}

variable "availability_zone-1b" {
  type    = string
  default = "ap-south-1b"
}

variable "kiaasa-development-bastion-host-ami" {
  type    = string
  default = "ami-045e6fa7127ab1ac4"
}
#kiaasa_public-subnet-1a-cidr
#kiaasa_public-subnet-1b-cidr
#kiaasa_private-subnet-1a-cidr
#kiaasa_private-subnet-1b-cidr