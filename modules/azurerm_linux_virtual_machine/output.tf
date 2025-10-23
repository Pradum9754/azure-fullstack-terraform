output "vm_ids" {
  value = { for k, vm in azurerm_linux_virtual_machine.vm_reusable : k => vm.id }
}

output "vm_names" {
  value = { for k, vm in azurerm_linux_virtual_machine.vm_reusable : k => vm.name }
}
