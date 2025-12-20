variable "nsg_mod" {
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

