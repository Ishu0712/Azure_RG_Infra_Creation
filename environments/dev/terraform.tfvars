
resource_group = {
  rg1 = {
    name     = "Flip_RG"
    location = "Central India"
  }
}


vnet-dev = {
  vnet1 = {
    vnet_name     = "VNET01"
    rg_name       = "Flip_RG"
    location      = "CentralIndia"
    address_space = ["10.0.0.0/16"]
    subnets = {
      S1 = {
        name             = "frontend-snet"
        address_prefixes = ["10.0.1.0/24"]
      }
      S2 = {
        name             = "backend-snet"
        address_prefixes = ["10.0.2.0/24"]
      }
    }
  }
}

nic-dev = {
  nic1 = {
    nic_name    = "frontend-nic"
    rg_name     = "Flip_RG"
    location    = "Central India"
    pip_name    = "frontend-pip"
    subnet_name = "frontend-snet"
    vnet_name   = "VNET01"
    ip_configuration = [
      {
        name                          = "frontend-ip"
        private_ip_address_allocation = "Dynamic"
      }
    ]
  }
}

pip_main = {
  pip1 = {
    pip_name          = "Frontend-pip"
    location          = "Central India"
    rg_name           = "Flip_rg"
    allocation_method = "static"
  }
}

nsg_dev = {
  nsg1 = {
    #data block variable 
    nic_name = "frontend-nic"
    #resource block variable
    nsg_name = "frontend-nsg"
    location = "Central India"
    rg_name  = "Flip_RG"

    security_rule = {
      nsg_rule_name              = "Allow-SSh"
      nsg_rule_priority          = 100
      nsg_rule_direction         = "Inbound"
      nsg_rule_access            = "Allow"
      nsg_rule_protocol          = "Tcp"
      source_port_range          = "*"
      destination_port_range     = "22"
      source_address_prefix      = "*"
      destination_address_prefix = "*"
    }
  }
}


vms_dev = {
  vm1 = {
    nic_name                        = "frontend-nic"
    location                        = "CentralIndia"
    rg_name                         = "Flip_RG"
    vnet_name                       = "VNET01"
    subnet_name                     = "frontend-snet"
    pip_name                        = "frontend-pip"
    vm_name                         = "pilu-vm"
    size                            = "Standard_F2"
    disable_password_authentication = false
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-jammy"
      sku       = "22_04-lts"
      version   = "latest"
    }
    os_disk = {
      name                 = "os_disk1"
      caching              = "Readwrite"
      storage_account_type = "standard_LRS"
    }
  }
}

stg_dev = {
  stg1 = {
    storage_name             = "front21vani"
    rg_name                  = "Flip_RG"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "LRS"
  }
}
