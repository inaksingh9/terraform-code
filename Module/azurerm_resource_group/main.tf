resource "azurerm_resource_group" "rgamit1" {
  for_each = var.rgs
  name     = each.value.name
  location = each.value.location
}

