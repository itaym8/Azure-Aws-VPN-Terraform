#################################
#      AWS Customer Gateway     #
#################################
resource "aws_customer_gateway" "aws_customer_gateway" {
  bgp_asn = var.bgp_asn
  ip_address = var.ip_address
  type = "ipsec.1"
  tags = var.tags
}