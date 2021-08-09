variable "local_network_gateway_name" {
  type = string
  description = "Local Network Gateway name"
}

variable "location" {
  type = string
  description = "Local Network Gateway location"
}

variable "local_network_gateway_resource_group_name" {
  type = string
  description = "Resource Group which the LNG will be deployed to"
}

variable "gateway_address" {
  type = string
  description = "The gateway IP address to connect with"
}

variable "address_space" {
  type = list(string)
  description = "The list of string CIDRs representing the address spaces the gateway exposes"
}

variable "bgp_peering_address" {
  type = string
  description = "The BGP peering address and BGP identifier of this BGP speaker"
}

variable "asn" {
  type = number
  description = "The BGP speaker's ASN"
}

variable "tags" {
  type = map(string)
  default = {}
}