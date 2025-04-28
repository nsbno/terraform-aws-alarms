resource "aws_cloudwatch_metric_alarm" "sns_no_data" {
  alarm_name        = "${var.sns_topic_name}-sns-topic-no-data-"
  alarm_description = "Alarm when no messages are published to the SNS topic ${var.sns_topic_name}"

  metric_name = "NumberOfMessagesPublished"
  namespace   = "AWS/SNS"

  dimensions = {
    TopicName = var.sns_topic_name
  }

  statistic           = "Sum"
  comparison_operator = "LessThanThreshold"
  threshold           = var.threshold
  period              = var.period
  evaluation_periods  = var.evaluation_periods
  treat_missing_data  = "ignore"

  alarm_actions = var.alarm_sns_topic_arns
  ok_actions    = var.alarm_sns_topic_arns
}
