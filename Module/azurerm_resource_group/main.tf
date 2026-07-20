resource "azurerm_resource_group" "rgamit1" {
  for_each = var.resourcegroup
  name     = each.value.name
  location = each.value.location
}