variable "vms" {
  type = map(object({
    nic_name                        = string
    location                        = string
    rg_name                         = string
    vnet_name                       = string
    subnet_name                     = string
    pip_name                        = string
    vm_name                         = string
    size                            = string
    disable_password_authentication = string
    source_image_reference = object({
      publisher = string
      offer     = string
      sku       = string
      version   = string
    })
    os_disk = object({
      name                 = string
      caching              = string
      storage_account_type = string
    })

  }))
}
