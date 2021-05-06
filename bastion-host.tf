




# data "template_file" "db_import_template" {
#   template = file("db-user-data.tpl")
#   vars = {
#     db_host     = "${aws_db_instance.kiaasa-development-rds-mysql.address}",
#     db_username = "${aws_db_instance.kiaasa-development-rds-mysql.username}"
#     db_name     = "${aws_db_instance.kiaasa-development-rds-mysql.name}"
#     db_password = "${var.development-db-password}"
#   }
# }




resource "aws_instance" "kiaasa-development-bastion-host-1a" {
  ami                         = var.kiaasa-development-bastion-host-ami
  key_name                    = "kiaasa-development"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.kiaasa-bastion-host-development-sg.id]
  subnet_id                   = aws_subnet.kiaasa_development_public-subnet-1a.id
  #user_data                   = data.template_file.db_import_template.rendered
  iam_instance_profile = aws_iam_instance_profile.bastion_host_profile.id
  tags = {
    Name      = "kiaasa-development-bastion-host-1a"
    Terraform = "True"
  }

}


resource "aws_instance" "kiaasa-development-bastion-host-1b" {
  ami                         = var.kiaasa-development-bastion-host-ami
  key_name                    = "kiaasa-development"
  instance_type               = "t2.micro"
  associate_public_ip_address = true
  vpc_security_group_ids      = [aws_security_group.kiaasa-bastion-host-development-sg.id]
  subnet_id                   = aws_subnet.kiaasa_development_public-subnet-1b.id
  tags = {
    Name      = "kiaasa-development-bastion-host-1b"
    Terraform = "True"
  }

}