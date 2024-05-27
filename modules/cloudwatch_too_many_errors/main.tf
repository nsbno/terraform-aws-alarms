terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "this" {
  metric_name         = "logback.events.count"
  alarm_name          = "${var.ecs_service_name}-errors-log"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  namespace           = var.ecs_service_name
  dimensions = {
    level = "error"
  }
  threshold          = var.error_threshold
  period             = var.period
  evaluation_periods = var.times_failed
  treat_missing_data = var.treat_missing_data
  statistic          = "Sum"
  alarm_description  = "${var.ecs_service_name} has logged too many errors"
  alarm_actions      = var.alarm_sns_topic_arns
  ok_actions         = var.alarm_sns_topic_arns
}
