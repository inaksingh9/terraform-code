rgs = {
  rg1 = {
    name     = "rg-amit1-prod"
    location = "Central India"
  }
  rg2 = {
    name     = "rg-amit2-prod"
    location = "Central India"
  }
  rg3 = {
    name     = "rg-amit3-prod"
    location = "Central India"
  }
}

pip = {
  # pip1 = {
  #   name                = "pipamit1-prod"
  #   resource_group_name = "rg-amit1-prod"
  #   location            = "Central India"
  # }
  
  pip_bastion = {
    name                = "pip-bastion-prod"
    resource_group_name = "rg-amit1-prod"
    location            = "Central India"
    sku                 = "Standard"
  }
  pip_lb = {
    name                = "pip-lb-prod"
    resource_group_name = "rg-amit1-prod"
    location            = "Central India"
    sku                 = "Standard"
  }

}

storageaccount = {
  stgamit1 = {
    name                     = "storageamit1prod"
    resource_group_name      = "rg-amit1-prod"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
  stgamit2 = {
    name                     = "storageamit2prod"
    resource_group_name      = "rg-amit2-prod"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
  stamit3 = {
    name                     = "storageamit3prod"
    resource_group_name      = "rg-amit3-prod"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}

vnets = {
  vnetamit1 = {
    name                = "vnetamit1-prod"
    location            = "Central India"
    resource_group_name = "rg-amit1-prod"
    address_space       = ["10.124.0.0/24"]
  }
  vnetamit2 = {
    name                = "vnetamit2-prod"
    location            = "Central India"
    resource_group_name = "rg-amit2-prod"
    address_space       = ["10.124.1.0/24"]
  }
  vnetamit3 = {
    name                = "vnetamit3-prod"
    location            = "Central India"
    resource_group_name = "rg-amit3-prod"
    address_space       = ["10.124.2.0/24"]
  }
}

subnets = {
  subnet1 = {
    name                 = "subnetamit1-prod"
    resource_group_name  = "rg-amit1-prod"
    virtual_network_name = "vnetamit1-prod"
    address_prefixes     = ["10.124.0.0/26"]
  }
  bastion_subnet = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "rg-amit1-prod"
    virtual_network_name = "vnetamit1-prod"
    address_prefixes     = ["10.124.0.64/26"]
  }
  subnet2 = {
    name                 = "subnetamit2-prod"
    resource_group_name  = "rg-amit2-prod"
    virtual_network_name = "vnetamit2-prod"
    address_prefixes     = ["10.124.1.0/26"]
  }
  subnet3 = {
    name                 = "subnetamit3-prod"
    resource_group_name  = "rg-amit3-prod"
    virtual_network_name = "vnetamit3-prod"
    address_prefixes     = ["10.124.2.0/26"]
  }
}

nsg = {
  nsgamit1 = {
    name                = "nsgamit1-prod"
    resource_group_name = "rg-amit1-prod"
    location            = "Central India"
  }
  nsgamit2 = {
    name                = "nsgamit2-prod"
    resource_group_name = "rg-amit2-prod"
    location            = "Central India"
  }
  nsgamit3 = {
    name                = "nsgamit3-prod"
    resource_group_name = "rg-amit3-prod"
    location            = "Central India"
  }
}

vms = {
  vm1 = {
    nic_name             = "frontend-nic-prod"
    location             = "Central India"
    resource_group_name  = "rg-amit1-prod"
    # pip_name             = "pipamit1-prod"
    snet_name            = "subnetamit1-prod"
    virtual_network_name = "vnetamit1-prod"
    vm_name              = "frontend-vm-prod"
    size                 = "Standard_D2s_v3"
    keyvault_name        = "kv-amit-vault-prod"
    keyvault_rg          = "rg-amit1-prod"
    username_secret_name = "adminusername"
    password_secret_name = "adminpassword"
  }
  vm2 = {
    nic_name             = "backend-nic-prod"
    location             = "Central India"
    resource_group_name  = "rg-amit2-prod"
    # pip_name             = "pipamit2-prod"
    snet_name            = "subnetamit2-prod"
    virtual_network_name = "vnetamit2-prod"
    vm_name              = "backend-vm-prod"
    size                 = "Standard_D2s_v3"
    keyvault_name        = "kv-amit-vault-prod"
    keyvault_rg          = "rg-amit1-prod"
    username_secret_name = "adminusername"
    password_secret_name = "adminpassword"
  }
}

nics = {
  vm1 = {
    nic_name             = "frontend-nic-prod"
    location             = "Central India"
    resource_group_name  = "rg-amit1-prod"
    # pip_name             = "pipamit1-prod"
    snet_name            = "subnetamit1-prod"
    virtual_network_name = "vnetamit1-prod"
  }
  vm2 = {
    nic_name             = "backend-nic-prod"
    location             = "Central India"
    resource_group_name  = "rg-amit2-prod"
    # pip_name             = "pipamit2-prod"
    snet_name            = "subnetamit2-prod"
    virtual_network_name = "vnetamit2-prod"
  }
}

bastions = {
  bastion1 = {
    name                 = "bastion-prod"
    resource_group_name  = "rg-amit1-prod"
    location             = "Central India"
    snet_name            = "AzureBastionSubnet"
    virtual_network_name = "vnetamit1-prod"
    pip_name             = "pip-bastion-prod"
  }
}

lbs = {
  lb1 = {
    name                = "lb-prod"
    resource_group_name = "rg-amit1-prod"
    location            = "Central India"
    pip_name            = "pip-lb-prod"
    backend_pool_name   = "lbbp-prod"
    probe_name          = "lbprobe-prod"
    probe_port          = 80
    probe_protocol      = "Http"
    probe_request_path  = "/"
    rule_name           = "lbrule-prod"
    rule_port           = 80
    backend_port        = 80
    associated_nics = [
      { nic_name = "frontend-nic-prod", resource_group_name = "rg-amit1-prod" },
      { nic_name = "backend-nic-prod", resource_group_name = "rg-amit2-prod" }
    ]
  }
}

# appgws = {
#   appgw1 = {
#     name                 = "appgw-prod"
#     resource_group_name  = "rg-amit1-prod"
#     location             = "Central India"
#     snet_name            = "AppGatewaySubnet"
#     virtual_network_name = "vnetamit1-prod"
#     pip_name             = "pip-appgw-prod"
#   }
# }
#
# frontdoors = {
#   fd1 = {
#     name                = "frontdoor-prod"
#     resource_group_name = "rg-amit1-prod"
#     endpoint_name       = "endpoint-prod"
#     backend_host_name   = "frontend-vm-prod.azurewebsites.net"
#   }
# }

