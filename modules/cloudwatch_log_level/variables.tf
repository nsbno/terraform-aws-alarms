variable "application_name" {
  description = "The name of the ECS Service"
  type        = string
}

variable "alarm_name" {
  description = "The name of the CloudWatch alarm"
  type        = string
}

variable "log_group_name" {
  description = "The name of the log group to monitor"
  type        = string
}

variable "log_level_field_name" {
  description = "The field in the log that contains the log level, e.g. level"
  type        = string
  default     = "level"
}
variable "log_level_to_monitor" {
  description = "The log level to monitor for errors, e.g. ERROR"
  type        = string
  default     = "ERROR"
}

variable "alarm_sns_topic_arns" {
  description = "Where to send Alarms and OKs"
  type        = list(string)
}


/*
 * == Alarm Configuration
 */
variable "alarm_threshold" {
  description = "Threshold of matching events before the alarm is triggered"
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
  default     = "notBreaching"
}


variable "period" {
  description = "Period in seconds to check for the applied statistic"
  type        = number
  default     = 60
}
