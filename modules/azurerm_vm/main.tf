resource "azurerm_linux_virtual_machine" "vm_machine" {
  for_each                        = var.vms
  name                            = each.value.vm_name
  resource_group_name             = each.value.rg_name
  location                        = each.value.location
  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.kvsecrus.value
  admin_password                  = data.azurerm_key_vault_secret.kvsecrpw.value
  disable_password_authentication = each.value.disable_password_authentication
  network_interface_ids = [
    data.azurerm_network_interface.nic_id[each.key].id,
  ]
  source_image_reference {
    publisher = each.value.source_image_reference.publisher
    offer     = each.value.source_image_reference.offer
    sku       = each.value.source_image_reference.sku
    version   = each.value.source_image_reference.version
  }
  os_disk {
    name                 = "os_disk1"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

}
