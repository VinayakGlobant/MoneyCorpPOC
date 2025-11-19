module "notification_dashboard" {
  source              = "../../modules/dashboard-deploy"
  dashboard_name      = var.dashboard_name
  dashboard_json_path = var.dashboard_json_path
  resource_group      = var.target_resource_group
  location            = var.location
}
