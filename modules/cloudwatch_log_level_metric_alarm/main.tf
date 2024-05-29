terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}


resource "aws_cloudwatch_log_metric_filter" "log_level_metric_filter" {
  name           = "LogLevelMetricFilter"
  pattern        = "{ $.${var.log_level_field_name} = \"${var.log_level_to_monitor}\" }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "LogLevelMetricFilter"
    namespace = var.application_name
    value     = "1"
  }
}


resource "aws_cloudwatch_metric_alarm" "this" {
  metric_name         = aws_cloudwatch_log_metric_filter.log_level_metric_filter.name
  alarm_name          = var.alarm_name
  comparison_operator = "GreaterThanOrEqualToThreshold"
  namespace           = var.application_name
  threshold           = var.alarm_tolerance
  period              = var.period
  evaluation_periods  = var.evaluation_periods
  treat_missing_data  = var.treat_missing_data
  statistic           = "SampleCount"
  alarm_description   = "${var.application_name} has logged too many logs with level = ${var.log_level_to_monitor}"
  alarm_actions       = var.alarm_sns_topic_arns
  ok_actions          = var.alarm_sns_topic_arns
}
