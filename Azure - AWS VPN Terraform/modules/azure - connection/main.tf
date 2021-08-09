#################################
#        Azure Connection       #
#################################
resource "azurerm_virtual_network_gateway_connection" "virtual_network_gateway_connection" {
  location = var.location
  name = var.connection_name
  resource_group_name = var.connection_resource_group_name
  type = var.connection_type
  virtual_network_gateway_id = var.virtual_network_gateway_id
  local_network_gateway_id = var.local_network_gateway_id
  shared_key = var.shared_key
  enable_bgp = var.enable_bgp
}