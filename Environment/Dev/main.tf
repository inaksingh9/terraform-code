module "resource_group" {
  source = "../../Module/azurerm_resource_group"
  rgs    = var.rgs
}

module "public_ip" {
  source     = "../../Module/azurerm_public_ip"
  pip        = var.pip
  depends_on = [module.resource_group]
}

module "virtual_network" {
  source     = "../../Module/azurerm_virtual_network"
  vnets      = var.vnets
  depends_on = [module.resource_group]
}

module "subnet" {
  source     = "../../Module/azurerm_subnet"
  subnets    = var.subnets
  depends_on = [module.virtual_network]
}

module "network_security_group" {
  source     = "../../Module/azurerm_network_security_group"
  nsg        = var.nsg
  depends_on = [module.resource_group]
}

module "storage_account" {
  source         = "../../Module/azurerm_storage_account"
  storageaccount = var.storageaccount
  depends_on     = [module.resource_group]
}

module "virtual_machine" {
  source     = "../../Module/azurerm_virtual_machine"
  vms        = var.vms
  nics       = var.nics
  depends_on = [module.subnet, module.public_ip]
}

module "bastion" {
  source     = "../../Module/azurerm_bastion_host"
  bastions   = var.bastions
  depends_on = [module.subnet, module.public_ip]
}

module "load_balancer" {
  source     = "../../Module/azurerm_lb"
  lbs        = var.lbs
  depends_on = [module.subnet, module.public_ip]
}

# module "application_gateway" {
#   source     = "../../Module/azurerm_application_gateway"
#   appgws     = var.appgws
#   depends_on = [module.subnet, module.public_ip]
# }
#
# module "front_door" {
#   source     = "../../Module/azurerm_frontdoor"
#   frontdoors = var.frontdoors
# }
