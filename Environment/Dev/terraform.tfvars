storageaccount = {
  stgamit1 = {
    name                     = "storageamit1"
    resource_group_name      = "rg-amit1"
    location                 = "East US"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
  stgamit2 = {
    name                     = "storageamit2"
    resource_group_name      = "rg-amit2"
    location                 = "West US"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }
  stamit3 = {
    name                     = "storageamit3"
    resource_group_name      = "rg-amit3"
    location                 = "Central US"
    account_tier             = "Standard"
    account_replication_type = "GRS"
  }

}