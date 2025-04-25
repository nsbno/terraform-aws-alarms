
variable "alarm_sns_topic_arns" {
  description = "Where to send Alarms and OKs"
  type        = list(string)
  default     = null
}

variable "sns_topic_name" {
  description = "Name of the SNS Topic. Used for the alarm name and dimensions"
  type        = string
}

/*
 * == Alarm Configuration
 */

variable "threshold" {
  description = "Threshold for the alarm to trigger"
  type        = number
  default     = 1
}

variable "evaluation_periods" {
  description = "Number of periods to evaluate the alarm for"
  type        = number
  default     = 1
}

variable "period" {
  description = "Period for the alarm in seconds"
  type        = number
  default     = 900 # 15 minutes
}
