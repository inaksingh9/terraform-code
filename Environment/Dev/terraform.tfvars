rgs = {
  rg1 = {
    name     = "rg-amit1"
    location = "Central India"
  }
  rg2 = {
    name     = "rg-amit2"
    location = "Central India"
  }
  rg3 = {
    name     = "rg-amit3"
    location = "Central India"
  }
}

pip = {
  pip1 = {
    name                = "pipamit1"
    resource_group_name = "rg-amit1"
    location            = "Central India"
  }
  pip2 = {
    name                = "pipamit2"
    resource_group_name = "rg-amit2"
    location            = "Central India"
  }

}

storageaccount = {
  stgamit1 = {
    name                     = "storageamit1"
    resource_group_name      = "rg-amit1"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
  stgamit2 = {
    name                     = "storageamit2"
    resource_group_name      = "rg-amit2"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
  stamit3 = {
    name                     = "storageamit3"
    resource_group_name      = "rg-amit3"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
}

vnets = {
  vnetamit1 = {
    name                = "vnetamit1"
    location            = "Central India"
    resource_group_name = "rg-amit1"
    address_space       = ["10.124.0.0/24"]
  }
  vnetamit2 = {
    name                = "vnetamit2"
    location            = "Central India"
    resource_group_name = "rg-amit2"
    address_space       = ["10.124.1.0/24"]
  }
  vnetamit3 = {
    name                = "vnetamit3"
    location            = "Central India"
    resource_group_name = "rg-amit3"
    address_space       = ["10.124.2.0/24"]
  }
}

subnets = {
  subnet1 = {
    name                 = "subnetamit1"
    resource_group_name  = "rg-amit1"
    virtual_network_name = "vnetamit1"
    address_prefixes     = ["10.124.0.0/26"]
  }
  subnet2 = {
    name                 = "subnetamit2"
    resource_group_name  = "rg-amit2"
    virtual_network_name = "vnetamit2"
    address_prefixes     = ["10.124.1.0/26"]
  }
  subnet3 = {
    name                 = "subnetamit3"
    resource_group_name  = "rg-amit3"
    virtual_network_name = "vnetamit3"
    address_prefixes     = ["10.124.2.0/26"]
  }
}

nsg = {
  nsgamit1 = {
    name                = "nsgamit1"
    resource_group_name = "rg-amit1"
    location            = "Central India"
  }
  nsgamit2 = {
    name                = "nsgamit2"
    resource_group_name = "rg-amit2"
    location            = "Central India"
  }
  nsgamit3 = {
    name                = "nsgamit3"
    resource_group_name = "rg-amit3"
    location            = "Central India"
  }
}

vms = {
  vm1 = {
    nic_name             = "frontend-nic"
    location             = "Central India"
    resource_group_name  = "rg-amit1"
    pip_name             = "pipamit1"
    snet_name            = "subnetamit1"
    virtual_network_name = "vnetamit1"
    vm_name              = "frontend-vm"
    size                 = "Standard_D2s_v3"
    keyvault_name        = "kv-amit-vault"
    keyvault_rg          = "rg-amit1"
    username_secret_name = "adminusername"
    password_secret_name = "adminpassword"
  }
  vm2 = {
    nic_name             = "backend-nic"
    location             = "Central India"
    resource_group_name  = "rg-amit2"
    pip_name             = "pipamit2"
    snet_name            = "subnetamit2"
    virtual_network_name = "vnetamit2"
    vm_name              = "backend-vm"
    size                 = "Standard_D2s_v3"
    keyvault_name        = "kv-amit-vault"
    keyvault_rg          = "rg-amit1"
    username_secret_name = "adminusername"
    password_secret_name = "adminpassword"
  }
}

nics = {
  vm1 = {
    nic_name             = "frontend-nic"
    location             = "Central India"
    resource_group_name  = "rg-amit1"
    pip_name             = "pipamit1"
    snet_name            = "subnetamit1"
    virtual_network_name = "vnetamit1"
  }
  vm2 = {
    nic_name             = "backend-nic"
    location             = "Central India"
    resource_group_name  = "rg-amit2"
    pip_name             = "pipamit2"
    snet_name            = "subnetamit2"
    virtual_network_name = "vnetamit2"
  }
}
