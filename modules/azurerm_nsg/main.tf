resource "azurerm_network_security_group" "nsg" {
  for_each            = var.nsg_mod
  name                = each.value.nsg_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  security_rule {
    name                       = each.value.security_rule.nsg_rule_name
    priority                   = each.value.security_rule.nsg_rule_priority
    direction                  = each.value.security_rule.nsg_rule_direction
    access                     = each.value.security_rule.nsg_rule_access
    protocol                   = each.value.security_rule.nsg_rule_protocol
    source_port_range          = each.value.security_rule.source_port_range
    destination_port_range     = each.value.security_rule.destination_port_range
    source_address_prefix      = each.value.security_rule.source_address_prefix
    destination_address_prefix = each.value.security_rule.destination_address_prefix
  }

}

resource "azurerm_network_interface_security_group_association" "nic_nsg" {
  for_each                  = var.nsg_mod
  network_interface_id      = data.azurerm_network_interface.nic[each.key].id
 network_security_group_id = data.azurerm_network_security_group.nsg_mod[each.key].id
# network_security_group_id = azurerm_network_security_group.nsg[each.key].id
}
