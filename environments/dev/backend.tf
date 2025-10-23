terraform {
  backend "azurerm" {
    resource_group_name  = "rg-dev"
    storage_account_name = "storagedevsolid1"
    container_name       = "containerdev1"
    key                  = "dev.terraform.tfstate"
  }
}
