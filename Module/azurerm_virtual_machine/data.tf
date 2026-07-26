data "azurerm_subnet" "snets" {
  for_each             = var.vms
  name                 = each.value.snet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = each.value.virtual_network_name
}

data "azurerm_public_ip" "pips" {
  for_each            = var.vms
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_key_vault" "kv" {
  for_each            = var.vms
  name                = each.value.keyvault_name
  resource_group_name = each.value.keyvault_rg
}

data "azurerm_key_vault_secret" "admin_username" {
  for_each     = var.vms
  name         = each.value.username_secret_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}

data "azurerm_key_vault_secret" "admin_password" {
  for_each     = var.vms
  name         = each.value.password_secret_name
  key_vault_id = data.azurerm_key_vault.kv[each.key].id
}