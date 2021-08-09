#################################
#       AWS Transit Gateway     #
#################################
resource "aws_ec2_transit_gateway" "transit_gateway" {
  amazon_side_asn = var.aws_asn
  tags = var.tags
}