terraform {
  backend "azurerm" {
    resource_group_name  = "rg-tfstate"          # pre-create
    storage_account_name = "stateprodmoneycorp"       # must exist
    container_name       = "tfstate"
    key                  = "dashboard-prod.terraform.tfstate"
  }
}
