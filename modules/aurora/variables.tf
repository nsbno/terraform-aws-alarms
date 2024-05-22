variable "aurora_db_instance_name" {
  description = "The name of the Aurora DB Instance"
  type        = string
}

variable "maximum_possible_cpu_credits" {
  description = "The maximum number of CPU credits that can be earned for the Aurora DB Instance." +
          " Available at https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/burstable-credits-baseline-concepts.html#burstable-performance-instances-credit-table"
}

variable "percentage_threshold_to_monitor" {
  description = "The percentage of spent surplus CPU credits to monitor for. The percentage is used to calculate" +
          " the threshold value by using the max possible cpu credits. Defaults to 60%."
  default = 0.6
}

variable "alarm_sns_topic_arns" {
  description = "Where to send Alarms and OKs"
  type        = list(string)
}


