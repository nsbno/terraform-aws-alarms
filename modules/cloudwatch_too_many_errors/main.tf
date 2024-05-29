terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}


resource "aws_cloudwatch_log_metric_filter" "error_log_metric_filter" {
  name           = "ErrorLogMetricFilter"
  pattern        = "{ $.level = \"ERROR\" }"
  log_group_name = var.log_group_name

  metric_transformation {
    name      = "ErrorLogMetricFilter"
    namespace = var.ecs_service_name
    value     = "1"
  }
}


resource "aws_cloudwatch_metric_alarm" "this" {
  metric_name         = aws_cloudwatch_log_metric_filter.error_log_metric_filter.name
  alarm_name          = "${var.ecs_service_name}-errors-log"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  namespace           = var.ecs_service_name
  threshold           = var.error_budget
  period              = var.period
  evaluation_periods  = var.evaluation_periods
  treat_missing_data  = var.treat_missing_data
  statistic           = "SampleCount"
  alarm_description   = "${var.ecs_service_name} has logged too many errors"
  alarm_actions       = var.alarm_sns_topic_arns
  ok_actions          = var.alarm_sns_topic_arns
}
