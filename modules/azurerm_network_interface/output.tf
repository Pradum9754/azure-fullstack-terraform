output "nic_ids" {
  value = { for k, nic in azurerm_network_interface.nic_reusable : k => nic.id }
}

output "nic_names" {
  value = { for k, nic in azurerm_network_interface.nic_reusable : k => nic.name }
}
