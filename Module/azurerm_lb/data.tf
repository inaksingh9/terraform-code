data "azurerm_public_ip" "pip" {
  for_each            = { for k, v in var.lbs : k => v if lookup(v, "pip_name", null) != null }
  name                = each.value.pip_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_network_interface" "nic" {
  for_each            = { for assoc in local.nic_associations : assoc.key => assoc }
  name                = each.value.nic_name
  resource_group_name = each.value.resource_group_name
}

locals {
  nic_associations = flatten([
    for lb_key, lb in var.lbs : [
      for idx, nic in lookup(lb, "associated_nics", []) : {
        key                 = "${lb_key}-${idx}"
        lb_key              = lb_key
        nic_name            = nic.nic_name
        resource_group_name = nic.resource_group_name
      }
    ]
  ])
}
