#################################
#        Subnet Variables       #
#################################
/*
variable "subnet_name" {
  type = string
  description = "VNG subnet's name"
}
*/
variable "vnet_name" {
  type = string
  description = "VNG Vnet's name"
}

variable "address_prefixes" {
  type = list(string)
  description = "Subnet Address Prefixes"
}

#################################
#         VNG Variables         #
#################################
variable "virtual_network_gateway_name" {
  type = string
  description = "Virtual Network Gateway name"
}

variable "location" {
  type = string
  description = "Virtual Network Gateway location"
}

variable "virtual_network_gateway_resource_group" {
  type = string
  description = "Resource Group which the VNG will be deployed to"
}

variable "virtual_network_gateway_type" {
  type = string
  description = "Virtual Network Gateway type"
  default = "vpn"
}

variable "vpn_type" {
  type = string
  description = "VPN type"
  default = "RouteBased"
}

variable "enable_bgp" {
  type = bool
  description = "Enable BGP - true or false"
  default = true
}

variable "virtual_network_gateway_sku" {
  type = string
  description = "Virtual Network Gateway sku"
  default = "VpnGw1"
}

variable "public_ip_id" {
  type = string
  description = "Public IP Address ID"
}

variable "active_active" {
  type = bool
  description = "Acrtive Active state - true or false"
  default = false
}

variable "private_ip_address_allocation" {
  type = string
  default = "Dynamic"
}

variable "asn" {
  type = number
  description = "Autonomous System Number (ASN) to use as part of the BGP"
}

variable "apipa_addresses" {
  type = list(string)
  description = "A list of Azure custom APIPA addresses assigned to the BGP peer of the Virtual Network Gateway"
  default = ["169.254.21.2"]
}

variable "tags" {
  type = map(string)
  default = {}
}