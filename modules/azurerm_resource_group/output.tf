output "rg_ids" {
  value = { for k, rg in azurerm_resource_group.rg_reusable : k => rg.id }
}

output "rg_names" {
  value = { for k, rg in azurerm_resource_group.rg_reusable : k => rg.name }
}
