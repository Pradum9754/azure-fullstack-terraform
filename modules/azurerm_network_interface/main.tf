resource "azurerm_network_interface" "nic_reusable" {
  for_each            = var.nic
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  tags                = each.value.tags

  ip_configuration {
    name                          = each.value.name
    subnet_id                     = each.value.subnet_id
    private_ip_address_allocation = each.value.private_ip_address_allocation
    public_ip_address_id          = lookup(each.value, "public_ip_address_id", null)  # safe lookup
  }
}


