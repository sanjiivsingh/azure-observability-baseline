output "workspace_id" {
  description = "The ID of the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.central.id
}

output "workspace_name" {
  description = "The name of the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.central.name
}

output "primary_shared_key" {
  description = "The primary shared key for the Log Analytics Workspace."
  value       = azurerm_log_analytics_workspace.central.primary_shared_key
  sensitive   = true
}

output "action_group_id" {
  description = "The ID of the Alert Action Group."
  value       = azurerm_monitor_action_group.ops.id
}
