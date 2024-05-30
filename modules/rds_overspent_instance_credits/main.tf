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
  alarm_name        = "${var.aurora_db_cluster_identifier}-aurora-cpu-surplus-credits-charged"
  alarm_description = "${var.aurora_db_cluster_identifier} has incurred charges for overspent CPU credits."

  metric_name = "CPUCreditSurplusCreditsCharged"
  namespace   = "AWS/RDS"

  dimensions = {
    DBClusterIdentifier = var.aurora_db_cluster_identifier
  }

  statistic           = "Sum"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  threshold           = var.amount_of_overspent_credits
  period              = var.period
  evaluation_periods  = var.times_failed
  treat_missing_data  = var.treat_missing_data

  alarm_actions = var.alarm_sns_topic_arns
  ok_actions    = var.alarm_sns_topic_arns
}
