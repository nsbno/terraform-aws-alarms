variable "name_prefix" {
  description = "Prefix to apply to the alarm names"
  type        = string
}

variable "target_group_arn_suffix" {
  description = "Target Group to monitor"
  type        = string
}

variable "load_balancer_arn_suffix" {
  description = "Load Balancer to monitor"
  type        = string
}

variable "alarm_sns_topic_arns" {
  description = "Where to send Alarms and OKs"
  type        = list(string)
}

/*
 * == Alarm Configuration
 */
variable "healthy_host_threshold" {
  description = "The amount of healthy hosts on the ALB before an alarm is triggered"
  type        = number

  default = 0
}

variable "healthy_hosts_times_failed" {
  description = "Number of times the healthy hosts test can fail before an alarm is triggered"
  type        = number

  default = 2
}
