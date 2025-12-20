data "azurerm_subnet" "subnet_ids" {
  for_each             = var.nic_card
  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.rg_name
}

data "azurerm_public_ip" "pip_ids" {
  for_each            = var.nic_card
  name                = each.value.pip_name
  resource_group_name = each.value.rg_name
}
