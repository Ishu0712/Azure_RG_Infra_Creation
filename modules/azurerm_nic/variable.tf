variable "nic_card" {
  type = map(object({
    #data block variable 
    vnet_name   = string
    subnet_name = string
    pip_name    = string
    # resource block variable 
    nic_name = string
    location = string
    rg_name  = string
    ip_configuration = list(object({
      name                          = string
      subnet_id                     = string
      private_ip_address_allocation = string
      public_ip_address_id          = string
    }))
  }))
}
