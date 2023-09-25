variable "name_prefix" {
  description = "Prefix to apply to the alarm names"
  type        = string
}

variable "api_name" {
  description = "The name of the API in API Gateway"
  type        = string
}

variable "alarm_sns_topic_arns" {
  description = "Where to send Alarms and OKs"
  type        = list(string)
}

/*
 * == Alarm Configuration
 */
variable "latency_threshold" {
  description = "The amount of milliseconds of latency the application must have before an alarm is triggered"
  type        = number

  default = 1000
}

variable "latency_times_failed" {
  description = "The amount of evaluation periods that should elapse before an alarm is triggered"
  type        = number

  default = 5
}

variable "error_5xx_threshold" {
  description = "The amount of 5XX errors before an alarm is triggered"
  type        = number

  default = 50
}

variable "error_5xx_times_failed" {
  description = "The amount of evaluation periods that should elapse before an alarm is triggered"
  type        = number

  default = 3
}
