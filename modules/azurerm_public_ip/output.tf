output "pip_ids" {
  value = { for k, pip in azurerm_public_ip.pip_reusable : k => pip.id }
}

output "pip_names" {
  value = { for k, pip in azurerm_public_ip.pip_reusable : k => pip.name }
}