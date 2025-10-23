output "vnet_name" {
  value = { for k, vnet in azurerm_virtual_network.vnet_reusable : k => vnet.name }
}

output "vnet_ids" {
  value = { for k, vnet in azurerm_virtual_network.vnet_reusable : k => vnet.id }
}

# azurerm_virtual_network.vnet_reusable → "This is a map created using a foreach loop."

# for k, vnet in ...:

# k = key from the map (such as  "vnet1", "vnet2")

# vnet = resource object (it is actual reference of vnet)

# k => vnet.id → creating a new map:

# key = k (means like "vnet1")

# value = us VNet's id