# CREATE FRONTEND AUTOSCALING POLICY

resource "aws_autoscaling_policy" "kiaasa-development-frontend-asg-policy" {
  name                   = "kiaasa-development-frontend-autoscaling-policy"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.kiaasa-development-frontend-asg.name
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 40.0
  }
}

# CREATE BACKEND AUTOSCALING POLICY

resource "aws_autoscaling_policy" "kiaasa-development-backend-asg-policy" {
  name                   = "kiaasa-development-backend-autoscaling-policy"
  policy_type            = "TargetTrackingScaling"
  autoscaling_group_name = aws_autoscaling_group.kiaasa-development-backend-asg.name
  target_tracking_configuration {
    predefined_metric_specification {
      predefined_metric_type = "ASGAverageCPUUtilization"
    }
    target_value = 40.0
  }
}