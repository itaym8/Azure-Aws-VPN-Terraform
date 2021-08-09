variable "client_id" {
  description = "The Client ID for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "client_secret" {
  description = "The Client Secret for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "tenant_id" {
  description = "The Tenant ID for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "subscription_id" {
  description = "The Subscription ID for the Service Principal to use for this Managed Kubernetes Cluster"
}


variable "azure_rg_location" {
  type = string
  description = "Azure Resource Group location"
}

variable "resource_group_name" {
  type = string
  description = "Azure Resource Group name"
}

variable "azure_vnet_address_space" {
  type = list(string)
  description = "Azure Vnet's address space"
}

variable "azure_vnet_name" {
  type = string
  description = "Azure Vnet's name"
}

variable "azure_public_ip_name" {
  type = string
  description = "Azure Public IP name"
}

variable "azure_vgn_subnet_address_prefixes" {
  type = list(string)
  description = "Azure Virtual Network Gateway's Subnet address prefixes"
}

variable "azure_virtual_network_gateway_name" {
  type = string
  description = "Azure Virtual Network Gateway name"
}

variable "azure_asn" {
  type = number
  description = "The Autonomous System Number (ASN) to use as part of the BGP"
}

variable "azure_lng_bgp_peering_address" {
  type = string
  description = "The BGP peering address and BGP identifier of this BGP speaker"
}

variable "azure_local_network_gateway_name" {
  type = string
  description = "AzureLocal Network Gateway's name"
}

variable "azure_connection_name" {
  type = string
  description = "Azure Connection name"
}

#AWS
variable "region" {
  type = string
}

variable "access_key" {
  type = string
}

variable "secret_key" {
  type = string
}

variable "aws_tunnel1_inside_cidr" {
  type = string
  description = "The CIDR block of the inside IP addresses for the first VPN tunnel. Valid value is a size /30 CIDR block from the 169.254.0.0/16 range"
}

variable "aws_asn" {
  type = number
  description = "The Autonomous System Number (ASN) to use as part of the BGP"
}

variable "vpn_preshared_key" {
  type = string
  description = "The preshared key of the first VPN tunnel. The preshared key must be between 8 and 64 characters in length and cannot start with zero(0). Allowed characters are alphanumeric characters, periods(.) and underscores(_)"
}
