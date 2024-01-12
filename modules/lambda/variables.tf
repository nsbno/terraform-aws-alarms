variable "lambda_name" {
  description = "The name of the Lambda"
  type        = string
}

variable "alarm_sns_topic_arns" {
  description = "Where to send Alarms and OKs"
  type        = list(string)
}

/*
 * == Alarm Configuration
 */

variable "error_threshold" {
  description = "Amount of times the lambda can fail before an alarm is triggered"
  type        = number
  default     = 1
}

variable "times_failed" {
  description = "Amount of elapsed evaluation periods before an alarm is triggered"
  type        = number
  default     = 1
}

variable "treat_missing_data" {
  description = "How this alarm is to handle missing data points"
  type        = string
  default     = "missing"
}


variable "period" {
  description = "Period in seconds to check for the applied statistic"
  type        = number
  default     = 60
}
