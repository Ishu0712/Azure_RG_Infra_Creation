variable "vm_bastion" {
  type = map(object({
    # Variables for data block
    subnet_name = string
    vnet_name   = string
    pip_name    = string
    #variables for bastion
    bastion_name = string
    location     = string
    rg_name      = string

    ip_configuration = object({
      name                 = string
      subnet_id            = string
      public_ip_address_id = string
      }
    )
  }))
}
