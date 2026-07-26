resource "azurerm_cdn_frontdoor_profile" "profile" {
  for_each            = var.frontdoors
  name                = each.value.name
  resource_group_name = each.value.resource_group_name
  sku_name            = lookup(each.value, "sku_name", "Standard_Microsoft")
}

resource "azurerm_cdn_frontdoor_endpoint" "endpoint" {
  for_each                 = var.frontdoors
  name                     = each.value.endpoint_name
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.profile[each.key].id
}

resource "azurerm_cdn_frontdoor_origin_group" "origin_group" {
  for_each                 = var.frontdoors
  name                     = "origingroup"
  cdn_frontdoor_profile_id = azurerm_cdn_frontdoor_profile.profile[each.key].id
  session_affinity_enabled = false

  load_balancing {
    additional_latency_in_milliseconds = 50
    sample_size                        = 4
    successful_samples_required        = 3
  }

  health_probe {
    path                = "/"
    request_type        = "HEAD"
    protocol            = "Http"
    interval_in_seconds = 100
  }
}

resource "azurerm_cdn_frontdoor_origin" "origin" {
  for_each                       = var.frontdoors
  name                           = "origin"
  cdn_frontdoor_origin_group_id  = azurerm_cdn_frontdoor_origin_group.origin_group[each.key].id
  enabled                        = true
  certificate_name_check_enabled = false
  host_name                      = each.value.backend_host_name
  http_port                      = 80
  https_port                     = 443
  origin_host_header             = each.value.backend_host_name
  priority                       = 1
  weight                         = 1000
}

resource "azurerm_cdn_frontdoor_route" "route" {
  for_each                      = var.frontdoors
  name                          = "route"
  cdn_frontdoor_endpoint_id     = azurerm_cdn_frontdoor_endpoint.endpoint[each.key].id
  cdn_frontdoor_origin_group_id = azurerm_cdn_frontdoor_origin_group.origin_group[each.key].id
  cdn_frontdoor_origin_ids      = [azurerm_cdn_frontdoor_origin.origin[each.key].id]

  supported_protocols    = ["Http", "Https"]
  patterns_to_match      = ["/*"]
  forwarding_protocol    = "HttpOnly"
  link_to_default_domain = true
}
