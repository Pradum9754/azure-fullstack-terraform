resource "azurerm_subnet_network_security_group_association" "subnsga_reusable" {
  for_each = var.subnsga
  subnet_id                 = each.value.subnet_id
  network_security_group_id = each.value.network_security_group_id
}

