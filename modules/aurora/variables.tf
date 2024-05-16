variable "aurora_db_instance_name" {
  description = "The name of the Aurora DB Instance"
  type        = string
}

variable "alarm_sns_topic_arns" {
  description = "Where to send Alarms and OKs"
  type        = list(string)
}
