output "sub_name" {
  value = { for k, sub in azurerm_subnet.sub_reusable : k => sub.name }
}

output "sub_ids" {
 value = { for k, sub in azurerm_subnet.sub_reusable : k => sub.id }
}