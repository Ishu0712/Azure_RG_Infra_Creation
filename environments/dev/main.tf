module "rg" {
  source         = "../../modules/azurerm_rg"
  resource_group = var.resource_group
}

module "virtual_network" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_vnet"
  vnets      = var.vnet-dev
}

module "nic_dev" {
  depends_on = [module.virtual_network, module.public_ip]
  source     = "../../modules/azurerm_nic"
  nic_card   = var.nic-dev
}

module "public_ip" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.pip_main
}

module "virtual_machine" {
  depends_on = [module.public_ip, module.virtual_network, module.nic_dev]
  source     = "../../modules/azurerm_vm"
  vms        = var.vms_dev
}

module "nsg_association" {
  depends_on = [module.nic_dev]
  source     = "../../modules/azurerm_nsg"
  nsg_mod    = var.nsg_dev
}

module "storage_account" {
  depends_on = [module.rg]
  source     = "../../modules/azurerm_storage_account"
  stg_mod    = var.stg_dev
}
