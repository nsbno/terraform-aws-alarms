terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "aurora_cpu_surplus_credits_charged" {
  alarm_name        = "${var.aurora_db_instance_name}-aurora-cpu-credits-empty"
  alarm_description = "${var.aurora_db_instance_name} has run out of Aurora CPU credits"

  metric_name = "CPUCreditSurplusCreditsCharged"
  namespace   = "AWS/RDS"

  dimensions = {
    DBInstanceIdentifier = var.aurora_db_instance_name
  }

  statistic           = "Sum"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  threshold           = 0
  period              = 300
  evaluation_periods  = 3

  alarm_actions = var.alarm_sns_topic_arns
  ok_actions    = var.alarm_sns_topic_arns
}
