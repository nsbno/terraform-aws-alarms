terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "service_health" {
  alarm_name        = "${var.application_name}-unhealthy"
  alarm_description = "${var.application_name} has ${var.healthy_host_threshold} or less healthy hosts"

  metric_name = "HealthyHostCount"
  namespace   = "AWS/ApplicationELB"

  dimensions = {
    TargetGroup  = var.target_group_arn_suffix
    LoadBalancer = var.load_balancer_arn_suffix
  }

  statistic           = "Sum"
  comparison_operator = "LessThanOrEqualToThreshold"
  threshold           = var.healthy_host_threshold
  period              = 60
  evaluation_periods  = var.healthy_hosts_times_failed

  alarm_actions = var.alarm_sns_topic_arns
  ok_actions    = var.alarm_sns_topic_arns
}

