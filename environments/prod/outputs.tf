# For RG
output "resource_group_ids" {
  value = module.rg_reusable.rg_ids
}

output "resource_group_names" {
  value = module.rg_reusable.rg_names
}

# For VNET
output "virtual_network_ids" {
  value = module.vnet_reusable.vnet_ids
}

output "virtual_network_names" {
  value = module.vnet_reusable.vnet_name
}

# For SUBNETS
output "subnet_ids" {
  value = module.sub_reusable.sub_ids
}

output "subnet_names" {
  value = module.sub_reusable.sub_name
}


# For NSG
output "nsg_ids" {
  value = module.nsg_reusable.nsg_ids
}

output "nsg_names" {
  value = module.nsg_reusable.nsg_name
}

# For sub_nsga
# Parent outputs.tf
# output "sub_nsga_ids" {
#   value = module.subnsga_reusable.subnsga_ids
# }

# output "sub_nsga_names" {
#   value = module.subnsga_reusable.subnsga_name
# }
output "sub_nsga_ids" {
  value = module.subnsga_reusable.sub_nsga_ids
}

output "sub_nsga_names" {
  value = module.subnsga_reusable.sub_nsga_names
}

# For pip
output "pip_ids" {
  value = module.pip_reusable.pip_ids
}

output "pip_names" {
  value = module.pip_reusable.pip_names
}

# For nic
output "nic_ids" {
  value = module.nic_reusable.nic_ids
}

output "nic_names" {
  value = module.nic_reusable.nic_names
}

# For vm
output "vm_ids" {
  value = module.vm_reusable.vm_ids
}

output "vm_names" {
  value = module.vm_reusable.vm_names
}