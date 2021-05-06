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


variable "development-certificate-arn" {
  type    = string
  default = "arn:aws:acm:ap-south-1:636177926524:certificate/6f25dbf0-3225-47a1-8635-ed43d8f33033"
}



variable "development-ami-id" {
  type    = string
  default = "ami-0d42f5aec9cd2c75c"
}

