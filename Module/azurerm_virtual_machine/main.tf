resource "azurerm_linux_virtual_machine" "vms" {
  for_each                        = var.vms
  name                            = each.value.vm_name
  location                        = each.value.location
  resource_group_name             = each.value.resource_group_name
  size                            = each.value.size
  admin_username                  = data.azurerm_key_vault_secret.admin_username[each.key].value
  admin_password                  = data.azurerm_key_vault_secret.admin_password[each.key].value
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nics[each.key].id
  ]

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }

  os_disk {
    name                 = "${each.value.vm_name}-osdisk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  tags = {
    environment = "dev"
  }
}

resource "azurerm_network_interface" "nics" {
  for_each            = var.nics
  name                = each.value.nic_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                          = "nic-amit"
    subnet_id                     = data.azurerm_subnet.snets[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.pips[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}
