#################################
#     Local Network Gateway     #
#################################
resource "azurerm_local_network_gateway" "local_network_gateway" {
  address_space = var.address_space
  gateway_address = var.gateway_address
  location = var.location
  name = var.local_network_gateway_name
  resource_group_name = var.local_network_gateway_resource_group_name
  bgp_settings {
    asn = var.asn
    bgp_peering_address = var.bgp_peering_address
  }
  tags = var.tags
}