#################################
#        AWS Site2Site VPN      #
#################################
resource "aws_vpn_connection" "aws_site2site_vpn" {
  customer_gateway_id = var.customer_gateway_id
  type = var.type
  transit_gateway_id = var.transit_gateway_id
  tunnel1_inside_cidr = var.tunnel1_inside_cidr
  tunnel1_preshared_key = var.tunnel1_preshared_key
  static_routes_only = var.static_routes_only
  tags = var.tags
}