variable "name_prefix" {
  description = "Prefix to apply to the alarm names"
  type = string
}

variable "ecs_cluster_name" {
  description = "The name of the ECS Cluster"
  type = string
}

variable "ecs_service_name" {
  description = "The name of the ECS Service"
  type = string
}

variable "alarm_sns_topic_arns" {
  description = "Where to send Alarms and OKs"
  type = list(string)
}

/*
 * == Alarm Configuration
 */
variable "memory_threshold" {
  description = "Percent of memory used before the alarm is triggered"
  type = number

  default = 80
}

variable "memory_times_failed" {
  description = "Amount of times the memory threshold is reached before an alarm is triggered"
  type = number

  default = 3
}

variable "cpu_threshold" {
  description = "Percent of CPU used before the alarm is triggered"
  type = number

  default = 80
}

variable "cpu_times_failed" {
  description = "Amount of times the CPU threshold is reached before an alarm is triggered"
  type = number

  default = 5
}
