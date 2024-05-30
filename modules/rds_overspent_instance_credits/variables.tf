variable "aurora_db_cluster_identifier" {
  description = "The name of the Aurora DB Instance"
  type        = string
}

variable "alarm_sns_topic_arns" {
  description = "Where to send Alarms and OKs"
  type        = list(string)
}

/*
 * == Alarm Configuration
 */
# Threshold
variable "amount_of_overspent_credits" {
  description = "Amount of Aurora CPU burst credits that have been overspent and will be charged."
  type        = number
  default     = 0
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
  default     = 300
}
