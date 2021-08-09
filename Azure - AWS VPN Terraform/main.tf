######################################
#        Create Resource Group       #
######################################
module "resource_group" {
  source = "./modules/azure - resource group"
  location = var.azure_rg_location
  resource_group_name = var.resource_group_name
}

######################################
#          Create Azure Vnet         #
######################################
module "azure_vnet" {
  source = "./modules/azure - virtual network"
  address_space = var.azure_vnet_address_space
  location = module.resource_group.resource_group_location
  resource_group_name = module.resource_group.resource_group_name
  vnet_name = var.azure_vnet_name
  depends_on = [module.resource_group]
}

######################################
#       Create Azure Public IP       #
######################################
module "azure_public_ip" {
  source = "./modules/azure - public ip"
  allocation_method = "Dynamic"
  location = module.resource_group.resource_group_location
  public_ip_name = var.azure_public_ip_name
  resource_group_name = module.resource_group.resource_group_name
  depends_on = [module.resource_group]
}

######################################
#          Create Azure VNG          #
######################################
module "azure_virtual_network_gateway" {
  source = "./modules/azure - virtual network gateway"
  address_prefixes = var.azure_vgn_subnet_address_prefixes
  location = module.resource_group.resource_group_location
  public_ip_id = module.azure_public_ip.public_ip_id
  virtual_network_gateway_name = var.azure_virtual_network_gateway_name
  virtual_network_gateway_resource_group = module.resource_group.resource_group_name
  vnet_name = module.azure_vnet.vnet_name
  asn = var.azure_asn
  depends_on = [module.azure_public_ip, module.resource_group]
}

######################################
#     Create AWS Transit Gateway     #
######################################
module "aws_transit_gateway" {
  source = "./modules/aws - transit gateway"
  aws_asn = var.aws_asn
  tags = {name = "azure-to-aws-tgw-2"}
  depends_on = [module.azure_virtual_network_gateway]
}

data "azurerm_public_ip" "get_public_ip_address" {
  name = module.azure_public_ip.public_ip_name
  resource_group_name = module.azure_public_ip.public_ip_resource_group
  depends_on = [module.azure_virtual_network_gateway]
}

output "ip_addrress" {
  value = module.azure_public_ip.public_ip_address
  depends_on = [data.azurerm_public_ip.get_public_ip_address]
}

######################################
#     Create AWS Customer Gateway    #
######################################
module "aws_customer_gateway" {
  source = "./modules/aws - customer gateway"
  bgp_asn = var.azure_asn
  #ip_address = module.azure_public_ip.public_ip_address
  ip_address = data.azurerm_public_ip.get_public_ip_address.ip_address
  tags = {name = "azure-to-aws-cgw-2"}
  depends_on = [module.aws_transit_gateway, module.azure_virtual_network_gateway, data.azurerm_public_ip.get_public_ip_address]
}

######################################
#      Create AWS Site2Site VPN      #
######################################
module "aws_site_to_site_vpn" {
  source = "./modules/aws - site to site vpn"
  customer_gateway_id = module.aws_customer_gateway.customer_gateway_id
  transit_gateway_id = module.aws_transit_gateway.transit_gateway_id
  tunnel1_inside_cidr = var.aws_tunnel1_inside_cide
  tunnel1_preshared_key = var.vpn_preshared_key
  type = "ipsec.1"
  tags = {name = "azure-to-aws-s2s-2"}
  depends_on = [module.aws_customer_gateway]
}

######################################
# Create Azure Local Network Gateway #
######################################
module "azure_local_network_gateway" {
  source = "./modules/azure - local network gateway"
  address_space = []
  asn = var.aws_asn
  bgp_peering_address = var.azure_lng_bgp_peering_address
  gateway_address = module.aws_site_to_site_vpn.outside_ip_address
  local_network_gateway_name = var.azure_local_network_gateway_name
  local_network_gateway_resource_group_name = module.resource_group.resource_group_name
  location = module.resource_group.resource_group_location
  depends_on = [module.aws_site_to_site_vpn, module.resource_group]
}

######################################
#     Create Azure VNG Connection    #
######################################
module "azure_virtual_network_gateway_connection" {
  source = "./modules/azure - connection"
  connection_name = var.azure_connection_name
  connection_resource_group_name = module.resource_group.resource_group_name
  location = module.resource_group.resource_group_location
  virtual_network_gateway_id = module.azure_virtual_network_gateway.virtual_network_gateway_id
  local_network_gateway_id = module.azure_local_network_gateway.local_network_gateway_id
  shared_key = var.vpn_preshared_key
  depends_on = [module.azure_local_network_gateway, module.resource_group]
}