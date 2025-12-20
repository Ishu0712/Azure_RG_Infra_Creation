
data "azurerm_network_interface" "nic_id" {
  for_each            = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.rg_name
}


data "azurerm_key_vault" "Ishkv" {
  name                = "Ishkv"
  resource_group_name = "RG02"
}

data "azurerm_key_vault_secret" "kvsecrus" {
  name         = "username"
  key_vault_id = data.azurerm_key_vault.Ishkv.id
}

data "azurerm_key_vault_secret" "kvsecrpw" {
  name         = "password"
  key_vault_id = data.azurerm_key_vault.Ishkv.id
}
