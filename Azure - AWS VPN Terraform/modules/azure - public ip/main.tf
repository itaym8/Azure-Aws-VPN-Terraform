#################################
#       Public IP Address       #
#################################
resource "azurerm_public_ip" "public_ip" {
  allocation_method = var.allocation_method
  location = var.location
  name = var.public_ip_name
  resource_group_name = var.resource_group_name
  sku = var.public_ip_sku
}