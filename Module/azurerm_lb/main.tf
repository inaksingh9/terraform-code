resource "azurerm_lb" "lb" {
  for_each            = var.lbs
  name                = each.value.name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku                 = "Standard"

  frontend_ip_configuration {
    name                 = "PublicIPAddress"
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}

resource "azurerm_lb_backend_address_pool" "pool" {
  for_each        = var.lbs
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.backend_pool_name
}

resource "azurerm_lb_probe" "probe" {
  for_each        = var.lbs
  loadbalancer_id = azurerm_lb.lb[each.key].id
  name            = each.value.probe_name
  port            = each.value.probe_port
  protocol        = lookup(each.value, "probe_protocol", "Http")
  request_path    = lookup(each.value, "probe_request_path", "/")
}

resource "azurerm_lb_rule" "rule" {
  for_each                       = var.lbs
  loadbalancer_id                = azurerm_lb.lb[each.key].id
  name                           = each.value.rule_name
  protocol                       = "Tcp"
  frontend_port                  = each.value.rule_port
  backend_port                   = each.value.backend_port
  frontend_ip_configuration_name = "PublicIPAddress"
  backend_address_pool_ids       = [azurerm_lb_backend_address_pool.pool[each.key].id]
  probe_id                       = azurerm_lb_probe.probe[each.key].id
}

resource "azurerm_network_interface_backend_address_pool_association" "association" {
  for_each                = { for assoc in local.nic_associations : assoc.key => assoc }
  network_interface_id    = data.azurerm_network_interface.nic[each.key].id
  ip_configuration_name   = "nic-amit"
  backend_address_pool_id = azurerm_lb_backend_address_pool.pool[each.value.lb_key].id
}
