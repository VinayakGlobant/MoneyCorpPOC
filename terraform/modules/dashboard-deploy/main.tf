locals {
  dashboard_props = jsondecode(file(var.dashboard_json_path))
}

resource "azurerm_resource_group" "rg" {
  name     = var.resource_group
  location = var.location
  # Optional: remove if RG pre-exists
}

resource "azurerm_template_deployment" "dashboard" {
  name                = "${var.dashboard_name}-deployment"
  resource_group_name = var.resource_group
  deployment_mode     = "Incremental"

  template_body = <<TEMPLATE
{
  "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
  "contentVersion": "1.0.0.0",
  "resources": [
    {
      "type": "Microsoft.Portal/dashboards",
      "apiVersion": "2019-01-01-preview",
      "name": "${var.dashboard_name}",
      "location": "${var.location}",
      "properties": ${jsonencode(local.dashboard_props)}
    }
  ]
}
TEMPLATE
}
