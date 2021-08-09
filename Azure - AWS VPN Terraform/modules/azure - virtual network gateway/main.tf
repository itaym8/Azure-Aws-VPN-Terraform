#################################
#         Subnet For VNG        #
#################################
resource "azurerm_subnet" "vng_subnet" {
  name = "GatewaySubnet"
  resource_group_name = var.virtual_network_gateway_resource_group
  virtual_network_name = var.vnet_name
  address_prefixes = var.address_prefixes
}

#################################
#     Virtual Network Gateway   #
#################################
resource "azurerm_virtual_network_gateway" "virtual_network_gateway" {
  location = var.location
  name = var.virtual_network_gateway_name
  resource_group_name = var.virtual_network_gateway_resource_group
  sku = var.virtual_network_gateway_sku
  type = var.virtual_network_gateway_type
  vpn_type = var.vpn_type
  active_active = var.active_active
  enable_bgp = var.enable_bgp
  ip_configuration {
    name = "vnetGatewayConfig"
    public_ip_address_id = var.public_ip_id
    subnet_id = azurerm_subnet.vng_subnet.id
    private_ip_address_allocation = var.private_ip_address_allocation
  }
  bgp_settings {
    asn = var.asn
    peering_addresses {
      apipa_addresses = var.apipa_addresses
    }
  }
  tags = var.tags
}