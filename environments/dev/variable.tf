variable "resource_group" {}

variable "nsg_dev" {
  type = map(object({
    #data block variable 
    nic_name = string
    #resource block variable
    nsg_name = string
    location = string
    rg_name  = string

    security_rule = object({
      nsg_rule_name              = string
      nsg_rule_priority          = string
      nsg_rule_direction         = string
      nsg_rule_access            = string
      nsg_rule_protocol          = string
      source_port_range          = string
      destination_port_range     = string
      source_address_prefix      = string
      destination_address_prefix = string
    })
  }))

}

variable "nic-dev" {
  type = map(object({
    nic_name    = string
    location    = string
    rg_name     = string
    pip_name    = string
    subnet_name = string
    vnet_name   = string
    ip_configuration = list(object({
      name                          = string
      subnet_id                     = optional(string)
      private_ip_address_allocation = string
      public_ip_address_id          = optional(string)
    }))
  }))
}


variable "vnet-dev" {
  type = map(object(
    {
      vnet_name     = string
      location      = string
      rg_name       = string
      address_space = list(string)

      subnets = map(object({
        name             = string
        address_prefixes = list(string)
      }))
    }
  ))
}




variable "pip_main" {
  description = "Map of public IP configurations"
  type = map(object({
    pip_name          = string
    location          = string
    rg_name           = string
    allocation_method = string
  }))
}

variable "vms_dev" {
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

variable "stg_dev" {
  type = map(object({
    storage_name             = string
    rg_name                  = string
    location                 = string
    account_tier             = string
    account_replication_type = string
  }))
}
