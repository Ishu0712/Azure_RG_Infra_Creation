data "azurerm_network_interface" "nic" {
  for_each            = var.nsg_mod
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
  #  depends_on          = [azurerm_network_security_group.nsg]
}


data "azurerm_network_security_group" "nsg_mod" {
  for_each            = var.nsg_mod
  name                = each.value.nsg_name
  resource_group_name = each.value.rg_name
  depends_on          = [azurerm_network_security_group.nsg]
}

