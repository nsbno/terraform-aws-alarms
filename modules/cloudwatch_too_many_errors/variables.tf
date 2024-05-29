variable "ecs_service_name" {
  description = "The name of the ECS Service"
  type        = string
}

variable "log_group_name" {
  description = "The name of the log group to monitor"
  type        = string
}

variable "alarm_sns_topic_arns" {
  description = "Where to send Alarms and OKs"
  type        = list(string)
}


/*
 * == Alarm Configuration
 */
variable "error_budget" {
  description = "Amount of errors the service can log before an alarm is triggered"
  type        = number
  default     = 5
}

variable "evaluation_periods" {
  description = "Amount of elapsed evaluation periods before an alarm is triggered"
  type        = number
  default     = 1
}

variable "treat_missing_data" {
  description = "How this alarm is to handle missing data points"
  type        = string
  default     = "notBreached"
}


variable "period" {
  description = "Period in seconds to check for the applied statistic"
  type        = number
  default     = 60
}
