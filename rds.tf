#Create Subnet Group

resource "aws_db_subnet_group" "kiaasa-development-db-subnet-group" {
  name       = "kiaasa-development-db-subnet-group"
  subnet_ids = [aws_subnet.kiaasa_development_private-subnet-1a.id, aws_subnet.kiaasa_development_private-subnet-1b.id]
  tags = {
    Name      = "Kiaasa-development-db-subnet-group"
    Terraform = "True"
  }
}

resource "aws_db_instance" "kiaasa-development-rds-mysql" {
  allocated_storage       = "10"
  storage_type            = "gp2"
  engine                  = "mysql"
  engine_version          = "5.6"
  multi_az                = "true"
  instance_class          = "db.t2.micro"
  name                    = "kiaasadevelopmentrds"
  username                = "admin"
  password                = var.development-db-password
  identifier              = "kiaasa-development-database"
  skip_final_snapshot     = "true"
  backup_retention_period = "7"
  port                    = "3306"
  storage_encrypted       = "false"
  db_subnet_group_name    = aws_db_subnet_group.kiaasa-development-db-subnet-group.name
  vpc_security_group_ids  = [aws_security_group.kiaasa-development-rds-sg.id]
  tags = {
    Name      = "kiaasa-development-rds-mysql"
    Terraform = "True"
  }
}