


data "template_file" "userdata_template" {
  template = file("user-data.tpl")
  vars = {
    db_host      = "${aws_db_instance.kiaasa-development-rds-mysql.address}",
    db_username  = "${aws_db_instance.kiaasa-development-rds-mysql.username}"
    db_password  = "${var.development-db-password}"
    db_name      = "${aws_db_instance.kiaasa-development-rds-mysql.name}"
    cache_host   = "${aws_elasticache_replication_group.kiaasa-development-elasticache.primary_endpoint_address}",
    efs-endpoint = "${aws_efs_file_system.kiaasa-development_efs.dns_name}"
  }
}







#Launch Configuration
resource "aws_launch_configuration" "kiaasa-development-launch-configuration" {
  name_prefix     = "Kiaasa Development Launch Configuration"
  image_id        = var.development-ami-id
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.kiaasa-development-asg-sg.id]
  key_name        = "kiaasa-development"
  user_data       = data.template_file.userdata_template.rendered
  lifecycle {
    create_before_destroy = true
  }
}

#Frontend AutoScaling Group
resource "aws_autoscaling_group" "kiaasa-development-frontend-asg" {
  name                 = "Kiaasa-development-frontend-asg"
  launch_configuration = aws_launch_configuration.kiaasa-development-launch-configuration.name
  health_check_type    = "ELB"
  min_size             = 0
  max_size             = 0
  desired_capacity     = 0
  vpc_zone_identifier = [
    aws_subnet.kiaasa_development_private-subnet-1a.id, aws_subnet.kiaasa_development_private-subnet-1b.id
  ]
  target_group_arns = [aws_lb_target_group.kiaasa-development-frontend-target-group.arn]
  lifecycle {
    create_before_destroy = true
  }
  tag {
    key                 = "Name"
    value               = "kiaasa-development-frontend-asg"
    propagate_at_launch = true
  }
}

#Backend AutoScaling Group
resource "aws_autoscaling_group" "kiaasa-development-backend-asg" {
  name                 = "Kiaasa-development-backend-asg"
  launch_configuration = aws_launch_configuration.kiaasa-development-launch-configuration.name
  health_check_type    = "ELB"
  min_size             = 0
  max_size             = 0
  desired_capacity     = 0
  vpc_zone_identifier = [
    aws_subnet.kiaasa_development_private-subnet-1a.id, aws_subnet.kiaasa_development_private-subnet-1b.id
  ]
  target_group_arns = [aws_lb_target_group.kiaasa-development-backend-target-group.arn]
  lifecycle {
    create_before_destroy = true
  }
  tag {
    key                 = "Name"
    value               = "kiaasa-development-backend-asg"
    propagate_at_launch = true
  }
}