# scale up alarm

resource "aws_autoscaling_policy" "cpu-policy-web" {
  name                   = "cpu-policy-web"
  autoscaling_group_name = "${aws_autoscaling_group.moonshot-autoscaling-web.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "cpu-alarm-web" {
  alarm_name          = "cpu-alarm-web"
  alarm_description   = "cpu-alarm-web"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.moonshot-autoscaling-web.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.cpu-policy-web.arn}"]
}

# scale up alarm

resource "aws_autoscaling_policy" "cpu-policy-app" {
  name                   = "cpu-policy-app"
  autoscaling_group_name = "${aws_autoscaling_group.moonshot-autoscaling-app.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "cpu-alarm-app" {
  alarm_name          = "cpu-alarm-app"
  alarm_description   = "cpu-alarm-app"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "30"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.moonshot-autoscaling-app.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.cpu-policy-app.arn}"]
}

# scale down alarm
resource "aws_autoscaling_policy" "cpu-policy-scaledown-web" {
  name                   = "cpu-policy-scaledown-web"
  autoscaling_group_name = "${aws_autoscaling_group.moonshot-autoscaling-web.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "cpu-alarm-scaledown-web" {
  alarm_name          = "cpu-alarm-scaledown-web"
  alarm_description   = "cpu-alarm-scaledown-web"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "5"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.moonshot-autoscaling-web.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.cpu-policy-scaledown-web.arn}"]
}

resource "aws_autoscaling_policy" "cpu-policy-scaledown-app" {
  name                   = "cpu-policy-scaledown-app"
  autoscaling_group_name = "${aws_autoscaling_group.moonshot-autoscaling-app.name}"
  adjustment_type        = "ChangeInCapacity"
  scaling_adjustment     = "-1"
  cooldown               = "300"
  policy_type            = "SimpleScaling"
}

resource "aws_cloudwatch_metric_alarm" "cpu-alarm-scaledown-app" {
  alarm_name          = "cpu-alarm-scaledown-app"
  alarm_description   = "cpu-alarm-scaledown-app"
  comparison_operator = "LessThanOrEqualToThreshold"
  evaluation_periods  = "2"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "5"

  dimensions = {
    "AutoScalingGroupName" = "${aws_autoscaling_group.moonshot-autoscaling-app.name}"
  }

  actions_enabled = true
  alarm_actions   = ["${aws_autoscaling_policy.cpu-policy-scaledown-app.arn}"]
}
