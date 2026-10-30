variable "resource_group_name" {
  type        = string
  description = "Name of the resource group for observability resources."
  default     = "rg-observability-prod-eastus"
}

variable "location" {
  type        = string
  description = "Azure region for deployment."
  default     = "eastus"
}

variable "workspace_name" {
  type        = string
  description = "Name of the central Log Analytics Workspace."
  default     = "law-central-prod-eastus"
}

variable "retention_in_days" {
  type        = number
  description = "Workspace retention period in days (30-730)."
  default     = 30
}

variable "daily_quota_gb" {
  type        = number
  description = "Daily ingestion cap in GB (-1 for unlimited)."
  default     = 5
}

variable "action_group_short_name" {
  type        = string
  description = "Short name of the monitor action group (up to 12 chars)."
  default     = "ops-alerts"
}

variable "alert_email" {
  type        = string
  description = "Email recipient for Sev1/Sev2 alerts."
  default     = "alerts-ops@example.com"
}

variable "tags" {
  type        = map(string)
  description = "Resource tags."
  default = {
    Environment = "production"
    ManagedBy   = "Terraform"
    Project     = "azure-observability-baseline"
  }
}
