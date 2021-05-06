# CREATE ELASTIC FILE SYSTEM
resource "aws_efs_file_system" "kiaasa-development_efs" {
  creation_token   = "kiaasa-development-elastic-file-system"
  performance_mode = "generalPurpose"
  throughput_mode  = "bursting"
  tags = {
    Name      = "kiaasa-development_efs"
    Terraform = "True"
  }
}

# CREATE ELASTIC FILE SYSTEM MOUNT TARGETS
resource "aws_efs_mount_target" "kiaasa-efs-mount-private-1a" {
  file_system_id  = aws_efs_file_system.kiaasa-development_efs.id
  subnet_id       = aws_subnet.kiaasa_development_private-subnet-1a.id
  security_groups = [aws_security_group.kiaasa-development_efs_sg.id]
}


resource "aws_efs_mount_target" "kiaasa-efs-mount-private-1b" {
  file_system_id  = aws_efs_file_system.kiaasa-development_efs.id
  subnet_id       = aws_subnet.kiaasa_development_private-subnet-1b.id
  security_groups = [aws_security_group.kiaasa-development_efs_sg.id]
}
