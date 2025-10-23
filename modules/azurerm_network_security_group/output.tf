output "nsg_name" {
  value = { for k, nsg in azurerm_network_security_group.nsg_reusable : k => nsg.name }
}

output "nsg_ids" {
  value = { for k, nsg in azurerm_network_security_group.nsg_reusable : k => nsg.id }
}
