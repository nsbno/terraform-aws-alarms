terraform {
  required_version = ">= 1.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 3.0.0"
    }
  }
}

resource "aws_cloudwatch_metric_alarm" "high_cpu_utilization" {
  alarm_name        = "${var.name_prefix}-${var.ecs_service_name}-cpu"
  alarm_description = "${var.ecs_service_name} has crossed the CPU usage treshold"

  metric_name = "CPUUtilization"
  namespace   = "AWS/ECS"
  dimensions  = {
    ClusterName = var.ecs_cluster_name
    ServiceName = var.ecs_service_name
  }

  statistic           = "Average"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  threshold           = var.cpu_threshold
  period              = 60
  evaluation_periods  = var.cpu_times_failed

  alarm_actions = var.alarm_sns_topic_arns
  ok_actions    = var.alarm_sns_topic_arns
}

resource "aws_cloudwatch_metric_alarm" "high_memory_utilization" {
  alarm_name        = "${var.name_prefix}-${var.ecs_service_name}-memory"
  alarm_description = "${var.ecs_service_name} has crossed the memory usage treshold"

  metric_name = "MemoryUtilization"
  namespace   = "AWS/ECS"
  dimensions  = {
    ClusterName = var.ecs_cluster_name
    ServiceName = var.ecs_service_name
  }

  statistic           = "Average"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  threshold           = var.memory_threshold
  period              = 60
  evaluation_periods  = var.memory_times_failed

  alarm_actions = var.alarm_sns_topic_arns
  ok_actions    = var.alarm_sns_topic_arns
}
