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
  alarm_name        = "${var.dlq_queue_name}-messages-in-dlq"
  alarm_description = "One or more events could not be processed and was put in the DLQ for ${var.dlq_queue_name}"

  alarm_actions = var.alarm_sns_topic_arns
  ok_actions    = var.alarm_sns_topic_arns

  comparison_operator = "GreaterThanOrEqualToThreshold"
  threshold           = var.threshold
  evaluation_periods  = var.evaluation_periods

  metric_name = "ApproximateNumberOfMessagesVisible"
  namespace   = "AWS/SQS"
  period      = 60
  statistic   = "Sum"
  unit        = "Count"

  dimensions = {
    QueueName = var.dlq_queue_name
  }
}
