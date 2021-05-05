terraform {
    required_version = "~> 0.14"
    required_providers {
        aws = {
            source = "hashicorp/aws"
            version = "~> 3.0"
        }
    }

    backend "s3" {

        bucket = "kiaasa-bucket-infra"
        key = "development/terraform.tfstate"
        region = "ap-south-1"
        dynamodb_table = "kiaasadevelopment"
    }
}

provider "aws" {
    region = var.aws_region
    profile = "default"

}




#kiaasa-bucket-infra
#kiaasainfradevelopment