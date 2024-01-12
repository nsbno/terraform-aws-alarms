terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "lambda_errors" {
  alarm_name        = "${var.lambda_name}-error"
  alarm_description = "${var.lambda_name} has had errors above configured threshold"

  metric_name = "Errors"
  namespace   = "AWS/Lambda"

  statistic           = "Sum"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  threshold           = var.error_threshold
  period              = var.period
  evaluation_periods  = var.times_failed
  treat_missing_data  = var.treat_missing_data

  dimensions = {
    FunctionName = var.lambda_name
  }

  alarm_actions = var.alarm_sns_topic_arns
  ok_actions    = var.alarm_sns_topic_arns
}

