resource "azurerm_resource_group" "obs" {
  name     = var.resource_group_name
  location = var.location
  tags     = var.tags
}

resource "azurerm_log_analytics_workspace" "central" {
  name                = var.workspace_name
  location            = azurerm_resource_group.obs.location
  resource_group_name = azurerm_resource_group.obs.name
  sku                 = "PerGB2018"
  retention_in_days   = var.retention_in_days
  daily_quota_gb      = var.daily_quota_gb
  tags                = var.tags
}

resource "azurerm_monitor_action_group" "ops" {
  name                = "ag-${var.action_group_short_name}"
  resource_group_name = azurerm_resource_group.obs.name
  short_name          = var.action_group_short_name
  tags                = var.tags

  email_receiver {
    name                    = "OperationsOnCall"
    email_address           = var.alert_email
    use_common_alert_schema = true
  }
}

resource "azurerm_monitor_metric_alert" "log_analytics_ingestion_spike" {
  name                = "alert-law-daily-quota-warning"
  resource_group_name = azurerm_resource_group.obs.name
  scopes              = [azurerm_log_analytics_workspace.central.id]
  description         = "Triggers when Log Analytics workspace ingestion approaches 80% of daily cap."
  severity            = 2
  frequency           = "PT15M"
  window_size         = "PT1H"

  criteria {
    metric_namespace = "Microsoft.OperationalInsights/workspaces"
    metric_name      = "DataIngestionVolume"
    aggregation      = "Total"
    operator         = "GreaterThan"
    threshold        = 4000 # in MB (~4 GB out of 5 GB cap)
  }

  action {
    action_group_id = azurerm_monitor_action_group.ops.id
  }
}
