resource "azurerm_bastion_host" "bastion" {
  for_each            = var.vm_bastion
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.rg_name

  ip_configuration {
    name                 = each.value.ip_configuration.name
    subnet_id            = data.azurerm_subnet.subnet_ids[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip_ids[each.key].id
  }
}
