resource "azurerm_resource_group" "rg_reusable" {
  for_each = var.rg
  name     = each.value.name
  location = each.value.location
  tags     = each.value.tags
}
