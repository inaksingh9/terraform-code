rgs = {
  rg1 = {
    name     = "rg-amit1-dev"
    location = "Central India"
  }
  rg2 = {
    name     = "rg-amit2-dev"
    location = "Central India"
  }
  rg3 = {
    name     = "rg-amit3-dev"
    location = "Central India"
  }
}

pip = {
  pip1 = {
    name                = "pipamit1-dev"
    resource_group_name = "rg-amit1-dev"
    location            = "Central India"
  }
  pip2 = {
    name                = "pipamit2-dev"
    resource_group_name = "rg-amit2-dev"
    location            = "Central India"
  }

}

storageaccount = {
  stgamit1 = {
    name                     = "storageamit1dev"
    resource_group_name      = "rg-amit1-dev"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
  stgamit2 = {
    name                     = "storageamit2dev"
    resource_group_name      = "rg-amit2-dev"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
  stamit3 = {
    name                     = "storageamit3dev"
    resource_group_name      = "rg-amit3-dev"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}

vnets = {
  vnetamit1 = {
    name                = "vnetamit1-dev"
    location            = "Central India"
    resource_group_name = "rg-amit1-dev"
    address_space       = ["10.124.0.0/24"]
  }
  vnetamit2 = {
    name                = "vnetamit2-dev"
    location            = "Central India"
    resource_group_name = "rg-amit2-dev"
    address_space       = ["10.124.1.0/24"]
  }
  vnetamit3 = {
    name                = "vnetamit3-dev"
    location            = "Central India"
    resource_group_name = "rg-amit3-dev"
    address_space       = ["10.124.2.0/24"]
  }
}

subnets = {
  subnet1 = {
    name                 = "subnetamit1-dev"
    resource_group_name  = "rg-amit1-dev"
    virtual_network_name = "vnetamit1-dev"
    address_prefixes     = ["10.124.0.0/26"]
  }
  subnet2 = {
    name                 = "subnetamit2-dev"
    resource_group_name  = "rg-amit2-dev"
    virtual_network_name = "vnetamit2-dev"
    address_prefixes     = ["10.124.1.0/26"]
  }
  subnet3 = {
    name                 = "subnetamit3-dev"
    resource_group_name  = "rg-amit3-dev"
    virtual_network_name = "vnetamit3-dev"
    address_prefixes     = ["10.124.2.0/26"]
  }
}

nsg = {
  nsgamit1 = {
    name                = "nsgamit1-dev"
    resource_group_name = "rg-amit1-dev"
    location            = "Central India"
  }
  nsgamit2 = {
    name                = "nsgamit2-dev"
    resource_group_name = "rg-amit2-dev"
    location            = "Central India"
  }
  nsgamit3 = {
    name                = "nsgamit3-dev"
    resource_group_name = "rg-amit3-dev"
    location            = "Central India"
  }
}

vms = {
  vm1 = {
    nic_name             = "frontend-nic-dev"
    location             = "Central India"
    resource_group_name  = "rg-amit1-dev"
    pip_name             = "pipamit1-dev"
    snet_name            = "subnetamit1-dev"
    virtual_network_name = "vnetamit1-dev"
    vm_name              = "frontend-vm-dev"
    size                 = "Standard_D2s_v3"
    keyvault_name        = "kv-amit-vault-dev"
    keyvault_rg          = "rg-amit1-dev"
    username_secret_name = "adminusername"
    password_secret_name = "adminpassword"
  }
  vm2 = {
    nic_name             = "backend-nic-dev"
    location             = "Central India"
    resource_group_name  = "rg-amit2-dev"
    pip_name             = "pipamit2-dev"
    snet_name            = "subnetamit2-dev"
    virtual_network_name = "vnetamit2-dev"
    vm_name              = "backend-vm-dev"
    size                 = "Standard_D2s_v3"
    keyvault_name        = "kv-amit-vault-dev"
    keyvault_rg          = "rg-amit1-dev"
    username_secret_name = "adminusername"
    password_secret_name = "adminpassword"
  }
}

nics = {
  vm1 = {
    nic_name             = "frontend-nic-dev"
    location             = "Central India"
    resource_group_name  = "rg-amit1-dev"
    pip_name             = "pipamit1-dev"
    snet_name            = "subnetamit1-dev"
    virtual_network_name = "vnetamit1-dev"
  }
  vm2 = {
    nic_name             = "backend-nic-dev"
    location             = "Central India"
    resource_group_name  = "rg-amit2-dev"
    pip_name             = "pipamit2-dev"
    snet_name            = "subnetamit2-dev"
    virtual_network_name = "vnetamit2-dev"
  }
}
