# output "subnsg_name" {
#   value = { for k, subnsga in azurerm_subnet_network_security_group_association.subnsga_reusable : k => subnsga.name }
# }

# output "subnsg_ids" {
#   value = { for k, subnsga in azurerm_subnet_network_security_group_association.subnsga_reusable : k => subnsga.id }
# }

# output "sub_nsga_ids" {
#   value = {
#     for k, subnsga in azurerm_subnet_network_security_group_association.subnsga_reusable : k => subnsga.id
#   }
# }

# output "sub_nsga_names" {
#   value = {
#     for k, subnsga in azurerm_subnet_network_security_group_association.subnsga_reusable : k => subnsga.name
#   }
# }

output "sub_nsga_ids" {
  value = {
    for k, subnsga in azurerm_subnet_network_security_group_association.subnsga_reusable : k => subnsga.id
  }
}

output "sub_nsga_names" {
  value = keys(azurerm_subnet_network_security_group_association.subnsga_reusable)
}
