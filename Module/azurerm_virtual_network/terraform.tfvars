vnets={
  vnetamit1 = {
    name                = "vnetamit1"
    location            = "East US"
    resource_group_name = "rg-amit1"
    address_space       = ["10.124.0.0/24"]
  }
  vnetamit2 = {
    name                = "vnetamit2"
    location            = "West US"
    resource_group_name = "rg-amit2"
    address_space       = ["10.124.1.0/24"]
}
vnetamit3 = {
    name                = "vnetamit3"
    location            = "Central US"
    resource_group_name = "rg-amit3"
    address_space       = ["10.124.2.0/24"]
}
}