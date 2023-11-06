variable "dlq_queue_name" {
  description = "Name of the SQS Queue. Used for the alarm name"
  type        = string
}

variable "alarm_sns_topic_arns" {
  description = "Where to send Alarms and OKs"
  type        = list(string)
}

/*
 * == Alarm Configuration
 */

variable "threshold" {
  description = "Amount of messages in DLQ before alarm is triggered"
  type        = number
  default     = 1
}

variable "evaluation_periods" {
  description = "Number of periods to evaluate the alarm for"
  type        = number
  default     = 1
}


