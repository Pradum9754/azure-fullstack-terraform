terraform {
  backend "azurerm" {
    resource_group_name  = "rg-new"
    storage_account_name = "storageprodsolid"  # you can use same stg account depend on project otherwise u can deploy diff- diff subscriptions
    container_name       = "containerprod2"    # same for container
    key                  = "prod.terraform.tfstate"  
  }
}
