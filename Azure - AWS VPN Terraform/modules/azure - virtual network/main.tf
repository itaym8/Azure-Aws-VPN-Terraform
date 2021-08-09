resource "azurerm_virtual_network" "virtual_network" {
  address_space = var.address_space
  location = var.location
  name = var.vnet_name
  resource_group_name = var.resource_group_name
}