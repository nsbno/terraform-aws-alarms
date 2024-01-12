terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "high_latency" {
  alarm_name        = "${var.api_name}-latency"
  alarm_description = "${var.api_name} latency is above configured treshold"

  metric_name = "IntegrationLatency"
  namespace   = "AWS/ApiGateway"

  dimensions = {
    ApiName = var.api_name
  }

  statistic           = "Average"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  threshold           = var.latency_threshold
  period              = 60
  evaluation_periods  = var.latency_times_failed
  treat_missing_data  = "ignore"

  alarm_actions = var.alarm_sns_topic_arns
  ok_actions    = var.alarm_sns_topic_arns
}

resource "aws_cloudwatch_metric_alarm" "num_errors_service" {
  alarm_name        = "${var.api_name}-5xx-errors"
  alarm_description = "${var.api_name} has crossed the 5xx error treshold"

  metric_name = "5XXError"
  namespace   = "AWS/ApiGateway"

  dimensions = {
    ApiName = var.api_name
  }

  statistic           = "Average"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  threshold           = var.error_5xx_threshold
  period              = 60
  evaluation_periods  = var.error_5xx_times_failed
  treat_missing_data  = "ignore"

  alarm_actions = var.alarm_sns_topic_arns
  ok_actions    = var.alarm_sns_topic_arns
}

