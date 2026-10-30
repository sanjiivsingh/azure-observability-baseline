variable "diagnostic_setting_name" {
  type        = string
  description = "Name of the diagnostic setting."
}

variable "target_resource_id" {
  type        = string
  description = "Azure resource ID to stream logs and metrics from."
}

variable "log_analytics_workspace_id" {
  type        = string
  description = "Target central Log Analytics Workspace ID."
}

variable "log_categories" {
  type        = list(string)
  description = "List of log category names to enable."
  default     = []
}

variable "metric_categories" {
  type        = list(string)
  description = "List of metric category names to enable."
  default     = ["AllMetrics"]
}
